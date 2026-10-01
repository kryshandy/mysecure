// src/crypto.rs - Cryptographic functions
use hmac::{Hmac, Mac};
use pbkdf2::pbkdf2_hmac;
use sha1::Sha1;
use subtle::ConstantTimeEq;

type HmacSha1 = Hmac<Sha1>;

pub fn pbkdf2_sha1(passphrase: &str, ssid: &str, iterations: u32) -> Vec<u8> {
    let mut output = [0u8; 32];
    pbkdf2_hmac::<Sha1>(passphrase.as_bytes(), ssid.as_bytes(), iterations, &mut output);
    output.to_vec()
}

pub fn compute_pmkid(pmk: &[u8], bssid: &str, sta_mac: &str) -> Option<Vec<u8>> {
    // PMKID = HMAC-SHA1-128(PMK, "PMK Name" || BSSID || STA MAC)
    let bssid = crate::utils::parse_mac(bssid)?;
    let sta_mac = crate::utils::parse_mac(sta_mac)?;
    let mut mac = HmacSha1::new_from_slice(pmk).ok()?;
    
    mac.update(b"PMK Name");
    mac.update(&bssid);
    mac.update(&sta_mac);
    
    let result = mac.finalize().into_bytes();
    Some(result[..16].to_vec())
}

pub fn compute_ptk(pmk: &[u8], anonce: &[u8], snonce: &[u8], bssid: &[u8], sta_mac: &[u8]) -> Vec<u8> {
    // PTK = PRF-512(PMK, "Pairwise key expansion", Min(AA, SA) || Max(AA, SA) || Min(ANonce, SNonce) || Max(ANonce, SNonce))
    let mut data = Vec::new();
    data.extend_from_slice(b"Pairwise key expansion");
    
    // Min/Max of MAC addresses
    if bssid < sta_mac {
        data.extend_from_slice(bssid);
        data.extend_from_slice(sta_mac);
    } else {
        data.extend_from_slice(sta_mac);
        data.extend_from_slice(bssid);
    }
    
    // Min/Max of nonces
    if anonce < snonce {
        data.extend_from_slice(anonce);
        data.extend_from_slice(snonce);
    } else {
        data.extend_from_slice(snonce);
        data.extend_from_slice(anonce);
    }
    
    prf_512(pmk, &data)
}

fn prf_512(key: &[u8], data: &[u8]) -> Vec<u8> {
    let mut result = Vec::with_capacity(64);
    let mut counter = 0u8;
    
    while result.len() < 64 {
        let Ok(mut mac) = HmacSha1::new_from_slice(key) else {
            return Vec::new();
        };
        mac.update(data);
        mac.update(&[counter]);
        result.extend_from_slice(&mac.finalize().into_bytes());
        counter += 1;
    }
    
    result.truncate(64);
    result
}

pub fn verify_mic(ptk: &[u8], eapol_data: &[u8]) -> bool {
    if ptk.len() < 16 || eapol_data.len() < 93 {
        return false;
    }

    // Extract KCK (first 16 bytes of PTK)
    let kck = &ptk[0..16];
    
    // Compute MIC over EAPOL frame with MIC field zeroed
    // This is simplified - real implementation needs proper EAPOL parsing
    let Ok(mut mac) = HmacSha1::new_from_slice(kck) else {
        return false;
    };
    mac.update(eapol_data);
    
    let computed_mic = mac.finalize().into_bytes();
    
    // Compare with MIC in frame (bytes 77-92 for EAPOL-Key)
    let frame_mic = &eapol_data[77..93];
    bool::from(computed_mic[..16].ct_eq(frame_mic))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pbkdf2_sha1() {
        let result = pbkdf2_sha1("password", "ssid", 4096);
        assert_eq!(result.len(), 32);
    }

    #[test]
    fn test_pmkid() {
        let pmk = vec![0u8; 32];
        let result = compute_pmkid(&pmk, "aa:bb:cc:dd:ee:ff", "11:22:33:44:55:66")
            .expect("valid MAC addresses");
        assert_eq!(result.len(), 16);
    }
}
