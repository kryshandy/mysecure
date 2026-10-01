// src/capture.rs - Handshake and PMKID capture
use std::time::{Duration, Instant};
use pcap::{Capture, Device, Packet as PcapPacket};

pub type CaptureCallback = Box<dyn FnMut(String, Vec<u8>, u8) + Send>;
pub type PmkidCallback = Box<dyn FnMut(String, Vec<u8>) + Send>;
pub type LogCallback = Box<dyn FnMut(i32, String) + Send>;

pub struct HandshakeCapture {
    interface: String,
    target_bssid: String,
    channel: u8,
    running: bool,
    captured_frames: Vec<(u8, Vec<u8>)>, // (frame_type, data)
}

impl HandshakeCapture {
    pub fn new(interface: String, target_bssid: String, channel: u8) -> Self {
        Self {
            interface,
            target_bssid: target_bssid.to_lowercase(),
            channel,
            running: false,
            captured_frames: Vec::new(),
        }
    }

    pub fn start(&mut self, mut callback: CaptureCallback, mut log: LogCallback) -> Result<(), String> {
        self.running = true;
        
        let device = Device::list()
            .map_err(|e| format!("Failed to list devices: {}", e))?
            .into_iter()
            .find(|d| d.name == self.interface)
            .ok_or("Interface not found")?;

        let mut cap = Capture::from_device(device)
            .map_err(|e| format!("Failed to open device: {}", e))?
            .promisc(true)
            .snaplen(65535)
            .timeout(1000)
            .open()
            .map_err(|e| format!("Failed to open capture: {}", e))?;

        // Filter for target BSSID and EAPOL/deauth frames
        let filter = format!("wlan host {} and (ether proto 0x888e or (type mgt subtype deauth))", self.target_bssid);
        cap.filter(&filter)
            .map_err(|e| format!("Failed to set filter: {}", e))?;

        // Set channel
        super::scan::set_channel_system(&self.interface, self.channel)
            .map_err(|e| format!("Failed to set channel: {}", e))?;

        log(1, format!("Starting handshake capture for {} on channel {}", self.target_bssid, self.channel));

        let timeout = Duration::from_secs(60);
        let start = Instant::now();

        while self.running && start.elapsed() < timeout {
            match cap.next_packet() {
                Ok(packet) => {
                    if let Some((frame_type, data)) = self.process_packet(&packet) {
                        self.captured_frames.push((frame_type, data.clone()));
                        callback(self.target_bssid.clone(), data, frame_type);
                        
                        // Check if we have complete handshake
                        if self.is_handshake_complete() {
                            log(1, "Complete 4-way handshake captured!".to_string());
                            break;
                        }
                    }
                }
                Err(pcap::Error::TimeoutExpired) => continue,
                Err(e) => {
                    log(3, format!("Capture error: {}", e));
                    break;
                }
            }
        }

        self.running = false;
        log(1, format!("Handshake capture stopped. Frames captured: {}", self.captured_frames.len()));
        Ok(())
    }

    fn process_packet(&self, packet: &PcapPacket) -> Option<(u8, Vec<u8>)> {
        if packet.data.len() < 24 {
            return None;
        }

        let frame_control = u16::from_le_bytes([packet.data[0], packet.data[1]]);
        let frame_type = (frame_control >> 2) & 0x3;
        let frame_subtype = (frame_control >> 4) & 0xF;

        // EAPOL frames (data frames with LLC/SNAP = 0x888e)
        if frame_type == 2 {
            // Check for LLC/SNAP header (8 bytes) + EAPOL
            if packet.data.len() > 32 {
                let llc_start = 24; // After 802.11 header
                if packet.data.len() > llc_start + 8 {
                    let ethertype = u16::from_be_bytes([packet.data[llc_start + 6], packet.data[llc_start + 7]]);
                    if ethertype == 0x888e { // EAPOL
                        let eapol_data = packet.data[llc_start + 8..].to_vec();
                        return Some((1, eapol_data)); // 1 = EAPOL
                    }
                }
            }
        }

        // Deauth frames
        if frame_type == 0 && frame_subtype == 12 {
            return Some((2, packet.data.to_vec())); // 2 = Deauth
        }

        None
    }

    fn is_handshake_complete(&self) -> bool {
        let mut has_msg1 = false;
        let mut has_msg2 = false;
        let mut has_msg3 = false;
        let mut has_msg4 = false;

        for (_, data) in &self.captured_frames {
            if data.len() < 7 {
                continue;
            }
            
            let eapol_type = data[1];
            let key_info = u16::from_be_bytes([data[5], data[6]]);
            
            // Check for EAPOL-Key frames
            if eapol_type == 3 { // EAPOL-Key
                let is_pairwise = (key_info & 0x0008) != 0;
                let key_ack = (key_info & 0x0080) != 0;
                let key_mic = (key_info & 0x0100) != 0;
                let install = (key_info & 0x0400) != 0;

                // Message 1: from AP, pairwise, ACK=0, MIC=0, Install=0
                if !is_pairwise && !key_ack && !key_mic && !install {
                    has_msg1 = true;
                }
                // Message 2: from STA, pairwise, ACK=0, MIC=1, Install=0
                else if is_pairwise && !key_ack && key_mic && !install {
                    has_msg2 = true;
                }
                // Message 3: from AP, pairwise, ACK=1, MIC=1, Install=1
                else if !is_pairwise && key_ack && key_mic && install {
                    has_msg3 = true;
                }
                // Message 4: from STA, pairwise, ACK=0, MIC=1, Install=0
                else if is_pairwise && !key_ack && key_mic && !install {
                    has_msg4 = true;
                }
            }
        }

        has_msg1 && has_msg2 && has_msg3 && has_msg4
    }
}

pub struct PmkidCapture {
    interface: String,
    target_bssid: String,
    channel: u8,
    running: bool,
}

impl PmkidCapture {
    pub fn new(interface: String, target_bssid: String, channel: u8) -> Self {
        Self {
            interface,
            target_bssid: target_bssid.to_lowercase(),
            channel,
            running: false,
        }
    }

    pub fn start(&mut self, mut callback: PmkidCallback, mut log: LogCallback) -> Result<(), String> {
        self.running = true;
        
        let device = Device::list()
            .map_err(|e| format!("Failed to list devices: {}", e))?
            .into_iter()
            .find(|d| d.name == self.interface)
            .ok_or("Interface not found")?;

        let mut cap = Capture::from_device(device)
            .map_err(|e| format!("Failed to open device: {}", e))?
            .promisc(true)
            .snaplen(65535)
            .timeout(1000)
            .open()
            .map_err(|e| format!("Failed to open capture: {}", e))?;

        // Filter for EAPOL frames from target
        let filter = format!("wlan host {} and ether proto 0x888e", self.target_bssid);
        cap.filter(&filter)
            .map_err(|e| format!("Failed to set filter: {}", e))?;

        super::scan::set_channel_system(&self.interface, self.channel)
            .map_err(|e| format!("Failed to set channel: {}", e))?;

        log(1, format!("Starting PMKID capture for {} on channel {}", self.target_bssid, self.channel));

        let timeout = Duration::from_secs(30);
        let start = Instant::now();

        while self.running && start.elapsed() < timeout {
            match cap.next_packet() {
                Ok(packet) => {
                    if let Some(pmkid) = self.extract_pmkid(&packet) {
                        callback(self.target_bssid.clone(), pmkid);
                        log(1, "PMKID captured!".to_string());
                        break;
                    }
                }
                Err(pcap::Error::TimeoutExpired) => continue,
                Err(e) => {
                    log(3, format!("Capture error: {}", e));
                    break;
                }
            }
        }

        self.running = false;
        log(1, "PMKID capture stopped".to_string());
        Ok(())
    }

    fn extract_pmkid(&self, packet: &PcapPacket) -> Option<Vec<u8>> {
        if packet.data.len() < 32 {
            return None;
        }

        // Check for EAPOL-Key with Key Data field containing PMKID
        let frame_control = u16::from_le_bytes([packet.data[0], packet.data[1]]);
        let frame_type = (frame_control >> 2) & 0x3;
        
        if frame_type != 2 {
            return None;
        }

        // Parse EAPOL
        let llc_start = 24;
        if packet.data.len() < llc_start + 8 {
            return None;
        }
        
        let ethertype = u16::from_be_bytes([packet.data[llc_start + 6], packet.data[llc_start + 7]]);
        if ethertype != 0x888e {
            return None;
        }

        let eapol_data = &packet.data[llc_start + 8..];
        if eapol_data.len() < 99 {
            return None;
        }

        let eapol_type = eapol_data[1];
        if eapol_type != 3 { // EAPOL-Key
            return None;
        }

        let key_data_len = u16::from_be_bytes([eapol_data[95], eapol_data[96]]) as usize;
        if key_data_len == 0 || eapol_data.len() < 99 + key_data_len {
            return None;
        }

        let key_data = &eapol_data[99..99 + key_data_len];
        
        // Parse Key Data for PMKID (Type 0x04)
        let mut offset = 0;
        while offset + 4 <= key_data.len() {
            let key_type = key_data[offset];
            let key_len = key_data[offset + 1] as usize;
            
            if offset + 2 + key_len > key_data.len() {
                break;
            }

            if key_type == 0x04 && key_len == 16 { // PMKID
                return Some(key_data[offset + 2..offset + 2 + 16].to_vec());
            }

            offset += 2 + key_len;
        }

        None
    }
}
