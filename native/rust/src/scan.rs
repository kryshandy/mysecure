// src/scan.rs - WiFi scanning engine
use std::collections::HashMap;
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::Arc;
use std::thread;
use std::time::{Duration, Instant};
use pcap::{Capture, Device, Packet as PcapPacket};

#[derive(Debug, Clone)]
pub struct AccessPointInfo {
    pub bssid: String,
    pub ssid: String,
    pub frequency: u32,
    pub channel: u8,
    pub signal_level: i32,
    pub security_protocol: u8,
    pub wps_enabled: bool,
    pub wps_manufacturer: Option<String>,
    pub wps_model: Option<String>,
}

#[derive(Debug, Clone)]
pub struct ScanConfig {
    pub interface: String,
    pub mode: i32,
    pub dwell_time_ms: u32,
    pub scan_cycles: u32,
    pub target_channels: Vec<u8>,
}

pub type ScanCallback = Box<dyn FnMut(AccessPointInfo) + Send>;
pub type LogCallback = Box<dyn FnMut(i32, String) + Send>;

pub struct ScanEngine {
    config: ScanConfig,
    cancel: Arc<AtomicBool>,
    seen_aps: HashMap<String, AccessPointInfo>,
    channel_hopper: Option<thread::JoinHandle<()>>,
}

impl ScanEngine {
    pub fn new(config: ScanConfig, cancel: Arc<AtomicBool>) -> Self {
        Self {
            config,
            cancel,
            seen_aps: HashMap::new(),
            channel_hopper: None,
        }
    }

    pub fn start(&mut self, mut callback: ScanCallback, mut log: LogCallback) -> Result<(), String> {
        if self.cancel.load(Ordering::Acquire) {
            return Ok(());
        }

        let device = Device::list()
            .map_err(|e| format!("Failed to list devices: {}", e))?
            .into_iter()
            .find(|d| d.name == self.config.interface)
            .ok_or("Interface not found")?;

        let mut cap = Capture::from_device(device)
            .map_err(|e| format!("Failed to open device: {}", e))?
            .promisc(true)
            .snaplen(65535)
            .timeout(1000)
            .open()
            .map_err(|e| format!("Failed to open capture: {}", e))?;

        cap.filter("type mgt subtype beacon or type mgt subtype probe-resp")
            .map_err(|e| format!("Failed to set filter: {}", e))?;

        // Start channel hopping if multiple channels
        if self.config.target_channels.len() > 1 {
            self.start_channel_hopping();
        } else if let Some(&ch) = self.config.target_channels.first() {
            self.set_channel(ch, &mut log)?;
        }

        log(1, format!("Starting scan on interface {}", self.config.interface));

        for cycle in 0..self.config.scan_cycles {
            if self.cancel.load(Ordering::Acquire) {
                break;
            }

            log(1, format!("Scan cycle {}/{}", cycle + 1, self.config.scan_cycles));

            let start = Instant::now();
            while start.elapsed() < Duration::from_millis(self.config.dwell_time_ms as u64) {
                if self.cancel.load(Ordering::Acquire) {
                    break;
                }

                match cap.next_packet() {
                    Ok(packet) => {
                        self.process_packet(&packet, &mut callback);
                    }
                    Err(pcap::Error::TimeoutExpired) => continue,
                    Err(e) => {
                        log(3, format!("Capture error: {}", e));
                        break;
                    }
                }
            }
        }

        self.cancel.store(true, Ordering::Release);
        if let Some(handle) = self.channel_hopper.take() {
            let _ = handle.join();
        }
        log(1, "Scan completed".to_string());
        Ok(())
    }

    fn process_packet(&mut self, packet: &PcapPacket, callback: &mut ScanCallback) {
        // Parse 802.11 management frames
        // This is a simplified parser - production would use pnet or custom parser
        if packet.data.len() < 24 {
            return;
        }

        let frame_control = u16::from_le_bytes([packet.data[0], packet.data[1]]);
        let frame_type = (frame_control >> 2) & 0x3;
        let frame_subtype = (frame_control >> 4) & 0xF;

        // Beacon frame (type 0, subtype 8) or Probe Response (type 0, subtype 5)
        if frame_type == 0 && (frame_subtype == 8 || frame_subtype == 5) {
            if let Some(ap) = self.parse_beacon_or_probe_resp(packet) {
                let is_new = !self.seen_aps.contains_key(&ap.bssid);
                self.seen_aps.insert(ap.bssid.clone(), ap.clone());

                if is_new || self.config.mode == 1 { // Active scan mode
                    callback(ap);
                }
            }
        }
    }

    fn parse_beacon_or_probe_resp(&self, packet: &PcapPacket) -> Option<AccessPointInfo> {
        // Simplified 802.11 parsing
        // Real implementation would properly parse all IEs
        if packet.data.len() < 36 {
            return None;
        }

        // BSSID is at offset 16 (after frame control, duration, addr1, addr2, addr3)
        let bssid_bytes = &packet.data[16..22];
        let bssid = format!("{:02x}:{:02x}:{:02x}:{:02x}:{:02x}:{:02x}",
            bssid_bytes[0], bssid_bytes[1], bssid_bytes[2],
            bssid_bytes[3], bssid_bytes[4], bssid_bytes[5]);

        // Parse IEs starting after fixed parameters (timestamp 8, beacon interval 2, capability 2 = 12 bytes)
        // Then SSID IE
        let mut offset = 36; // Radiotap header (approx) + 802.11 header + fixed params

        let mut ssid = String::new();
        let mut security_protocol = 0u8;
        let mut wps_enabled = false;
        let mut wps_manufacturer = None;
        let mut wps_model = None;
        let mut channel = 1u8;
        let mut frequency = 2412u32;
        let mut signal_level = -100i32;

        // Extract signal from radiotap header if present
        if packet.data.len() > 8 {
            // Radiotap header parsing would go here
            signal_level = packet.data[8] as i8 as i32 - 95; // Approximate
        }

        while offset + 2 < packet.data.len() {
            let ie_id = packet.data[offset];
            let ie_len = packet.data[offset + 1] as usize;

            if offset + 2 + ie_len > packet.data.len() {
                break;
            }

            let ie_data = &packet.data[offset + 2..offset + 2 + ie_len];

            match ie_id {
                0 => { // SSID
                    ssid = String::from_utf8_lossy(ie_data).to_string();
                }
                3 => { // DS Parameter Set (Channel)
                    if ie_len >= 1 {
                        channel = ie_data[0];
                        frequency = channel_to_frequency(channel);
                    }
                }
                48 => { // RSN Information (WPA2/WPA3)
                    security_protocol = parse_rsn(ie_data);
                }
                221 => { // Vendor Specific (WPS, etc.)
                    if ie_len >= 4 && &ie_data[0..3] == [0x00, 0x50, 0xf2] { // Microsoft OUI
                        if ie_len >= 5 && ie_data[3] == 0x04 { // WPS
                            wps_enabled = true;
                            // Parse WPS IEs for manufacturer/model
                        }
                    }
                }
                _ => {}
            }

            offset += 2 + ie_len;
        }

        Some(AccessPointInfo {
            bssid,
            ssid,
            frequency,
            channel,
            signal_level,
            security_protocol,
            wps_enabled,
            wps_manufacturer,
            wps_model,
        })
    }

    fn start_channel_hopping(&mut self) {
        let channels = self.config.target_channels.clone();
        let interface = self.config.interface.clone();
        let dwell = self.config.dwell_time_ms;
        let cancel = self.cancel.clone();

        let handle = thread::spawn(move || {
            let mut idx = 0;
            while !cancel.load(Ordering::Acquire) {
                let ch = channels[idx];
                let _ = set_channel_system(&interface, ch);
                let mut elapsed = 0;
                while elapsed < dwell && !cancel.load(Ordering::Acquire) {
                    let interval = (dwell - elapsed).min(50);
                    thread::sleep(Duration::from_millis(interval as u64));
                    elapsed += interval;
                }
                idx = (idx + 1) % channels.len();
            }
        });

        self.channel_hopper = Some(handle);
    }

    fn set_channel(&self, channel: u8, log: &mut LogCallback) -> Result<(), String> {
        set_channel_system(&self.config.interface, channel)
            .map_err(|e| format!("Failed to set channel: {}", e))?;
        log(1, format!("Set channel to {}", channel));
        Ok(())
    }

    pub fn stop(&mut self) {
        self.cancel.store(true, Ordering::Release);
        if let Some(handle) = self.channel_hopper.take() {
            let _ = handle.join();
        }
    }
}

impl Drop for ScanEngine {
    fn drop(&mut self) {
        self.cancel.store(true, Ordering::Release);
        if let Some(handle) = self.channel_hopper.take() {
            let _ = handle.join();
        }
    }
}

fn channel_to_frequency(channel: u8) -> u32 {
    match channel {
        1..=13 => 2407 + 5 * channel as u32,
        14 => 2484,
        36..=165 => 5000 + 5 * channel as u32,
        _ => 2412,
    }
}

pub(crate) fn set_channel_system(interface: &str, channel: u8) -> Result<(), String> {
    // Platform-specific channel setting
    #[cfg(target_os = "linux")]
    {
        use std::process::Command;
        let output = Command::new("iw")
            .args(["dev", interface, "set", "channel", &channel.to_string()])
            .output()
            .map_err(|e| e.to_string())?;

        if !output.status.success() {
            return Err(String::from_utf8_lossy(&output.stderr).to_string());
        }
    }
    #[cfg(target_os = "android")]
    {
        // Android requires root and different approach
    }
    Ok(())
}

fn parse_rsn(data: &[u8]) -> u8 {
    if data.len() < 8 {
        return 3; // WPA2 default
    }

    // RSN: version, group cipher, pairwise count/list, AKM count/list.
    let pairwise_count = u16::from_le_bytes([data[6], data[7]]) as usize;
    let Some(akm_count_offset) = 8usize.checked_add(pairwise_count.saturating_mul(4)) else {
        return 3;
    };
    if akm_count_offset + 2 > data.len() {
        return 3;
    }
    let akm_count = u16::from_le_bytes([
        data[akm_count_offset],
        data[akm_count_offset + 1],
    ]) as usize;
    let suites_start = akm_count_offset + 2;
    let suites_end = suites_start.saturating_add(akm_count.saturating_mul(4));
    if suites_end > data.len() {
        return 3;
    }

    for suite in data[suites_start..suites_end].chunks_exact(4) {
        if suite == [0x00, 0x0f, 0xac, 0x08] {
            return 4; // WPA3-SAE
        }
    }

    3 // Default WPA2
}
