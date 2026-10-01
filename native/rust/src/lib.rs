// C ABI entry points for the native Wi-Fi helpers.
// Exported functions validate arguments and catch Rust panics so they never
// unwind across the FFI boundary.
use std::ffi::{CStr, CString};
use std::os::raw::{c_char, c_int};
use std::panic::{catch_unwind, AssertUnwindSafe};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{Arc, Mutex, OnceLock};
use std::thread;

mod capture;
mod crypto;
mod scan;
mod utils;
mod wps;

use capture::{HandshakeCapture, PmkidCapture};
use crypto::{compute_pmkid, pbkdf2_sha1};
use scan::{ScanConfig, ScanEngine};
use wps::WpsTester;

const FFI_OK: c_int = 0;
const FFI_INVALID_ARGUMENT: c_int = -1;
const FFI_PANIC: c_int = -2;
const FFI_BUSY: c_int = -3;
const FFI_UNSUPPORTED: c_int = -4;

static SCAN_CANCEL: OnceLock<Mutex<Option<Arc<AtomicBool>>>> = OnceLock::new();

type LogCallback = extern "C" fn(level: c_int, message: *const c_char);
type WifiScanCallback = extern "C" fn(
    bssid: *const c_char,
    ssid: *const c_char,
    frequency: c_int,
    channel: c_int,
    signal_level: c_int,
    security_protocol: c_int,
    wps_enabled: c_int,
    wps_manufacturer: *const c_char,
    wps_model: *const c_char,
);
type HandshakeCallback = extern "C" fn(
    bssid: *const c_char,
    eapol_data: *const u8,
    eapol_len: c_int,
    frame_type: c_int,
);
type PmkidCallback =
    extern "C" fn(bssid: *const c_char, pmkid_data: *const u8, pmkid_len: c_int);
type WpsPinCallback =
    extern "C" fn(bssid: *const c_char, pin: *const c_char, method: c_int);

fn ffi_guard(action: impl FnOnce() -> c_int) -> c_int {
    catch_unwind(AssertUnwindSafe(action)).unwrap_or(FFI_PANIC)
}

fn read_c_string(pointer: *const c_char) -> Result<String, c_int> {
    if pointer.is_null() {
        return Err(FFI_INVALID_ARGUMENT);
    }
    // SAFETY: non-nullness is checked above. NUL termination and readable
    // memory remain part of the caller's C ABI contract.
    Ok(unsafe { CStr::from_ptr(pointer) }
        .to_string_lossy()
        .into_owned())
}

fn callback_string(value: impl AsRef<str>) -> CString {
    CString::new(value.as_ref().replace('\0', "�")).unwrap_or_default()
}

fn is_valid_interface(interface: &str) -> bool {
    !interface.is_empty()
        && interface.len() <= 64
        && interface
            .bytes()
            .all(|byte| byte.is_ascii_alphanumeric() || matches!(byte, b'_' | b'-' | b'.'))
}

fn is_valid_channel(channel: c_int) -> bool {
    (1..=233).contains(&channel)
}

fn log_callback_wrapper(callback: LogCallback, level: c_int, message: &str) {
    let message = callback_string(message);
    callback(level, message.as_ptr());
}

#[no_mangle]
pub extern "C" fn mysecure_wifi_start_scan(
    interface: *const c_char,
    scan_mode: c_int,
    dwell_time: c_int,
    scan_cycles: c_int,
    target_channels: *const c_char,
    callback: WifiScanCallback,
    log_callback: LogCallback,
) -> c_int {
    ffi_guard(|| {
        let interface = match read_c_string(interface) {
            Ok(value) if is_valid_interface(&value) => value,
            _ => return FFI_INVALID_ARGUMENT,
        };
        let channels = match read_c_string(target_channels) {
            Ok(value) => value,
            Err(code) => return code,
        };
        if !(0..=1).contains(&scan_mode)
            || !(10..=60_000).contains(&dwell_time)
            || !(1..=10_000).contains(&scan_cycles)
        {
            return FFI_INVALID_ARGUMENT;
        }

        let target_channels: Vec<u8> = match channels
            .split(',')
            .filter(|value| !value.trim().is_empty())
            .map(|value| value.trim().parse::<u8>())
            .collect::<Result<Vec<_>, _>>()
        {
            Ok(values) if values.iter().all(|channel| (1..=233).contains(channel)) => values,
            _ => return FFI_INVALID_ARGUMENT,
        };

        let cancel = Arc::new(AtomicBool::new(false));
        let mut active_scan = match SCAN_CANCEL.get_or_init(Default::default).lock() {
            Ok(value) => value,
            Err(_) => return FFI_BUSY,
        };
        if let Some(previous) = active_scan.replace(cancel.clone()) {
            previous.store(true, Ordering::Release);
        }
        drop(active_scan);

        let config = ScanConfig {
            interface,
            mode: scan_mode,
            dwell_time_ms: dwell_time as u32,
            scan_cycles: scan_cycles as u32,
            target_channels,
        };
        let mut engine = ScanEngine::new(config, cancel);
        let scan_callback = Box::new(move |ap: scan::AccessPointInfo| {
            let bssid = callback_string(ap.bssid);
            let ssid = callback_string(ap.ssid);
            let manufacturer = callback_string(ap.wps_manufacturer.unwrap_or_default());
            let model = callback_string(ap.wps_model.unwrap_or_default());
            callback(
                bssid.as_ptr(),
                ssid.as_ptr(),
                ap.frequency as c_int,
                ap.channel as c_int,
                ap.signal_level as c_int,
                ap.security_protocol as c_int,
                i32::from(ap.wps_enabled),
                manufacturer.as_ptr(),
                model.as_ptr(),
            );
        });
        let native_log = Box::new(move |level: c_int, message: String| {
            log_callback_wrapper(log_callback, level, &message);
        });

        thread::spawn(move || {
            let _ = engine.start(scan_callback, native_log);
        });
        FFI_OK
    })
}

#[no_mangle]
pub extern "C" fn mysecure_wifi_stop_scan() -> c_int {
    ffi_guard(|| {
        let mut active_scan = match SCAN_CANCEL.get_or_init(Default::default).lock() {
            Ok(value) => value,
            Err(_) => return FFI_BUSY,
        };
        if let Some(cancel) = active_scan.take() {
            cancel.store(true, Ordering::Release);
        }
        FFI_OK
    })
}

#[no_mangle]
pub extern "C" fn mysecure_wifi_send_deauth(
    bssid: *const c_char,
    count: c_int,
    interval: c_int,
) -> c_int {
    ffi_guard(|| {
        let bssid = match read_c_string(bssid) {
            Ok(value) => value,
            Err(code) => return code,
        };
        if utils::parse_mac(&bssid).is_none()
            || !(1..=10_000).contains(&count)
            || !(1..=60_000).contains(&interval)
        {
            return FFI_INVALID_ARGUMENT;
        }
        // Packet injection is platform-specific. Do not report a false success
        // until a supported implementation is linked.
        FFI_UNSUPPORTED
    })
}

#[no_mangle]
pub extern "C" fn mysecure_wifi_capture_handshake(
    interface: *const c_char,
    bssid: *const c_char,
    channel: c_int,
    callback: HandshakeCallback,
    log_callback: LogCallback,
) -> c_int {
    ffi_guard(|| {
        let interface = match read_c_string(interface) {
            Ok(value) if is_valid_interface(&value) => value,
            _ => return FFI_INVALID_ARGUMENT,
        };
        let bssid = match read_c_string(bssid) {
            Ok(value) if utils::parse_mac(&value).is_some() => value,
            _ => return FFI_INVALID_ARGUMENT,
        };
        if !is_valid_channel(channel) {
            return FFI_INVALID_ARGUMENT;
        }

        let mut capture = HandshakeCapture::new(interface, bssid, channel as u8);
        let capture_callback = Box::new(move |bssid: String, data: Vec<u8>, frame_type: u8| {
            let bssid = callback_string(bssid);
            callback(
                bssid.as_ptr(),
                data.as_ptr(),
                data.len() as c_int,
                frame_type as c_int,
            );
        });
        let native_log = Box::new(move |level: c_int, message: String| {
            log_callback_wrapper(log_callback, level, &message);
        });
        thread::spawn(move || {
            let _ = capture.start(capture_callback, native_log);
        });
        FFI_OK
    })
}

#[no_mangle]
pub extern "C" fn mysecure_wifi_capture_pmkid(
    interface: *const c_char,
    bssid: *const c_char,
    channel: c_int,
    callback: PmkidCallback,
    log_callback: LogCallback,
) -> c_int {
    ffi_guard(|| {
        let interface = match read_c_string(interface) {
            Ok(value) if is_valid_interface(&value) => value,
            _ => return FFI_INVALID_ARGUMENT,
        };
        let bssid = match read_c_string(bssid) {
            Ok(value) if utils::parse_mac(&value).is_some() => value,
            _ => return FFI_INVALID_ARGUMENT,
        };
        if !is_valid_channel(channel) {
            return FFI_INVALID_ARGUMENT;
        }

        let mut capture = PmkidCapture::new(interface, bssid, channel as u8);
        let capture_callback = Box::new(move |bssid: String, data: Vec<u8>| {
            let bssid = callback_string(bssid);
            callback(bssid.as_ptr(), data.as_ptr(), data.len() as c_int);
        });
        let native_log = Box::new(move |level: c_int, message: String| {
            log_callback_wrapper(log_callback, level, &message);
        });
        thread::spawn(move || {
            let _ = capture.start(capture_callback, native_log);
        });
        FFI_OK
    })
}

#[no_mangle]
pub extern "C" fn mysecure_wifi_test_wps(
    interface: *const c_char,
    bssid: *const c_char,
    channel: c_int,
    callback: WpsPinCallback,
    log_callback: LogCallback,
) -> c_int {
    ffi_guard(|| {
        let interface = match read_c_string(interface) {
            Ok(value) if is_valid_interface(&value) => value,
            _ => return FFI_INVALID_ARGUMENT,
        };
        let bssid = match read_c_string(bssid) {
            Ok(value) if utils::parse_mac(&value).is_some() => value,
            _ => return FFI_INVALID_ARGUMENT,
        };
        if !is_valid_channel(channel) {
            return FFI_INVALID_ARGUMENT;
        }

        let mut tester = WpsTester::new(interface, bssid, channel as u8);
        let pin_callback = Box::new(move |bssid: String, pin: String, method: u8| {
            let bssid = callback_string(bssid);
            let pin = callback_string(pin);
            callback(bssid.as_ptr(), pin.as_ptr(), method as c_int);
        });
        let native_log = Box::new(move |level: c_int, message: String| {
            log_callback_wrapper(log_callback, level, &message);
        });
        thread::spawn(move || {
            let _ = tester.start(pin_callback, native_log);
        });
        FFI_OK
    })
}

#[no_mangle]
pub extern "C" fn mysecure_crypto_pbkdf2_sha1(
    passphrase: *const c_char,
    ssid: *const c_char,
    output: *mut u8,
    iterations: c_int,
) -> c_int {
    ffi_guard(|| {
        if output.is_null() || !(1..=10_000_000).contains(&iterations) {
            return FFI_INVALID_ARGUMENT;
        }
        let passphrase = match read_c_string(passphrase) {
            Ok(value) if value.len() <= 1024 => value,
            _ => return FFI_INVALID_ARGUMENT,
        };
        let ssid = match read_c_string(ssid) {
            Ok(value) if value.as_bytes().len() <= 32 => value,
            _ => return FFI_INVALID_ARGUMENT,
        };
        let result = pbkdf2_sha1(&passphrase, &ssid, iterations as u32);
        // SAFETY: output is non-null and the ABI requires a writable 32-byte buffer.
        unsafe { std::ptr::copy_nonoverlapping(result.as_ptr(), output, result.len()) };
        FFI_OK
    })
}

#[no_mangle]
pub extern "C" fn mysecure_crypto_compute_pmkid(
    pmk: *const u8,
    bssid: *const c_char,
    sta_mac: *const c_char,
    output: *mut u8,
) -> c_int {
    ffi_guard(|| {
        if pmk.is_null() || output.is_null() {
            return FFI_INVALID_ARGUMENT;
        }
        let bssid = match read_c_string(bssid) {
            Ok(value) => value,
            Err(code) => return code,
        };
        let sta_mac = match read_c_string(sta_mac) {
            Ok(value) => value,
            Err(code) => return code,
        };
        // SAFETY: pmk is non-null and the ABI requires a readable 32-byte buffer.
        let pmk = unsafe { std::slice::from_raw_parts(pmk, 32) };
        let result = match compute_pmkid(pmk, &bssid, &sta_mac) {
            Some(value) => value,
            None => return FFI_INVALID_ARGUMENT,
        };
        // SAFETY: output is non-null and the ABI requires a writable 16-byte buffer.
        unsafe { std::ptr::copy_nonoverlapping(result.as_ptr(), output, result.len()) };
        FFI_OK
    })
}
