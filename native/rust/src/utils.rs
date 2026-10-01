// src/utils.rs - Utility functions
use std::net::Ipv4Addr;

pub fn parse_mac(mac: &str) -> Option<[u8; 6]> {
    let parts: Vec<&str> = mac.split(':').collect();
    if parts.len() != 6 {
        return None;
    }
    
    let mut bytes = [0u8; 6];
    for (i, part) in parts.iter().enumerate() {
        bytes[i] = u8::from_str_radix(part, 16).ok()?;
    }
    Some(bytes)
}

pub fn format_mac(bytes: &[u8]) -> String {
    bytes.iter()
        .map(|b| format!("{:02x}", b))
        .collect::<Vec<_>>()
        .join(":")
}

pub fn parse_ipv4(ip: &str) -> Option<Ipv4Addr> {
    ip.parse().ok()
}

pub fn cidr_to_range(cidr: &str) -> Option<(Ipv4Addr, Ipv4Addr)> {
    let parts: Vec<&str> = cidr.split('/').collect();
    if parts.len() != 2 {
        return None;
    }
    
    let ip = parts[0].parse::<Ipv4Addr>().ok()?;
    let prefix = parts[1].parse::<u8>().ok()?;
    if prefix > 32 {
        return None;
    }

    let mask = if prefix == 0 {
        0
    } else {
        u32::MAX << (32 - prefix)
    };
    let ip_u32 = u32::from(ip);
    let network = ip_u32 & mask;
    let broadcast = network | !mask;
    
    Some((Ipv4Addr::from(network), Ipv4Addr::from(broadcast)))
}

pub fn calculate_signal_quality(signal_dbm: i32, noise_dbm: i32) -> u8 {
    let snr = signal_dbm - noise_dbm;
    if snr >= 40 { 100 }
    else if snr >= 30 { 80 }
    else if snr >= 20 { 60 }
    else if snr >= 15 { 40 }
    else if snr >= 10 { 20 }
    else { 0 }
}

pub fn channel_to_frequency(channel: u8) -> u32 {
    match channel {
        1..=13 => 2407 + 5 * channel as u32,
        14 => 2484,
        36..=165 => 5000 + 5 * channel as u32,
        _ => 2412,
    }
}

pub fn frequency_to_channel(freq: u32) -> u8 {
    match freq {
        2412..=2472 => ((freq - 2407) / 5) as u8,
        2484 => 14,
        5180..=5825 => ((freq - 5000) / 5) as u8,
        _ => 0,
    }
}

pub fn is_5ghz_channel(channel: u8) -> bool {
    channel >= 36
}

pub fn get_channel_width(frequency: u32) -> u32 {
    // Simplified - real implementation would parse VHT/HE capabilities
    if frequency > 5000 { 80 } else { 20 }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_mac() {
        let mac = parse_mac("aa:bb:cc:dd:ee:ff").unwrap();
        assert_eq!(mac, [0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff]);
    }

    #[test]
    fn test_format_mac() {
        let formatted = format_mac(&[0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff]);
        assert_eq!(formatted, "aa:bb:cc:dd:ee:ff");
    }

    #[test]
    fn test_channel_to_frequency() {
        assert_eq!(channel_to_frequency(1), 2412);
        assert_eq!(channel_to_frequency(6), 2437);
        assert_eq!(channel_to_frequency(36), 5180);
    }

    #[test]
    fn test_frequency_to_channel() {
        assert_eq!(frequency_to_channel(2412), 1);
        assert_eq!(frequency_to_channel(2437), 6);
        assert_eq!(frequency_to_channel(5180), 36);
    }
}
