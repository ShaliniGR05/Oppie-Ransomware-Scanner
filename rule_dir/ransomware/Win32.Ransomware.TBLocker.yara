rule Win32_Ransomware_TBLocker : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "TBLOCKER"
        description         = "Yara rule that detects TBLocker ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "TBLocker"
        tc_detection_factor = 5

    strings:

        $main_ransomware_function_p1 = {
            00 02 16 28 ?? ?? ?? ?? 00 02 17 28 ?? ?? ?? ?? 00 02 16 28 ?? ?? ?? ?? 00 02 16 28 ?? ?? ?? ?? 00 02
            16 28 ?? ?? ?? ?? 00 02 28 ?? ?? ?? ?? 00 00 28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ??
            ?? 16 FE ?? 0A 06 2C ?? 28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 26 72 ?? ?? ?? ??
            28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 18 16 15 28 ?? ?? ?? ?? 26 00 00 28 ?? ?? ?? ?? 28 ?? ??
            ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 16 28 ?? ?? ?? ?? 16 FE ?? 0B 07 39 ?? ?? ?? ?? 28 ?? ?? ?? ?? 72
            ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 16 FE ?? 0C 08 2C ?? 28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ??
            ?? ?? 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ??
            ?? ?? ?? 28 ?? ?? ?? ?? 00 00 00 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 72 ?? ?? ?? ?? 17 6F ??
            ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 00 00 DE ?? 25
            28 ?? ?? ?? ?? 0D 00 28 ?? ?? ?? ?? DE ?? 00 02 72 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 02 17 28 ?? ?? ?? ??
            00 02 18 28 ?? ?? ?? ?? 00 02 6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 13 ?? 12 ?? 28 ?? ?? ?? ??
            6C 23 ?? ?? ?? ?? ?? ?? ?? ?? 5B 02 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 6C 23 ?? ?? ?? ?? ?? ?? ?? ?? 5B 59
        }

        $main_ransomware_function_p2 = {
            28 ?? ?? ?? ?? B7 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 13 ?? 12 ?? 28 ?? ?? ?? ?? 6C 23 ?? ?? ?? ?? ?? ?? ??
            ?? 5B 28 ?? ?? ?? ?? B7 73 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 02 6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ??
            ?? 13 ?? 12 ?? 28 ?? ?? ?? ?? 6C 23 ?? ?? ?? ?? ?? ?? ?? ?? 5B 02 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 6C 23
            ?? ?? ?? ?? ?? ?? ?? ?? 5B 59 28 ?? ?? ?? ?? B7 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 13 ?? 12 ?? 28 ?? ?? ??
            ?? 6C 23 ?? ?? ?? ?? ?? ?? ?? ?? 5B 23 ?? ?? ?? ?? ?? ?? ?? ?? 5A 28 ?? ?? ?? ?? B7 73 ?? ?? ?? ?? 6F
            ?? ?? ?? ?? 00 02 6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 13 ?? 12 ?? 28 ?? ?? ?? ?? 6C 23 ?? ??
            ?? ?? ?? ?? ?? ?? 5B 02 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 6C 23 ?? ?? ?? ?? ?? ?? ?? ?? 5B 59 28 ?? ?? ??
            ?? B7 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 13 ?? 12 ?? 28 ?? ?? ?? ?? 1F ?? DA 73 ?? ?? ?? ?? 6F ?? ?? ?? ??
            00 02 6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 13 ?? 12 ?? 28 ?? ?? ?? ?? 6C 23 ?? ?? ?? ?? ?? ??
            ?? ?? 5B 02 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 6C 23 ?? ?? ?? ?? ?? ?? ?? ?? 5B 59 28 ?? ?? ?? ?? B7 28 ??
            ?? ?? ?? 6F ?? ?? ?? ?? 13 ?? 12 ?? 28 ?? ?? ?? ?? 6C 23 ?? ?? ?? ?? ?? ?? ?? ?? 5B 23 ?? ?? ?? ?? ??
            ?? ?? ?? 5A 28 ?? ?? ?? ?? B7 73 ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 02 6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 6F
        }

        $search_files = {
            00 00 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 03 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 0A 38 ?? ?? ?? ?? 06 6F ?? ?? ?? 
            ?? 0B 07 07 6F ?? ?? ?? ?? 17 DA 6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 16 28 ?? ?? ?? ?? 16 FE 
            ?? 0C 08 2C ?? 07 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 16 FE ?? 0D 09 2C ?? 00 02 07 07 72 ?? 
            ?? ?? ?? 28 ?? ?? ?? ?? 02 7B ?? ?? ?? ?? 28 ?? ?? ?? ?? 00 07 28 ?? ?? ?? ?? 00 DE ?? 25 28 ?? ?? ?? 
            ?? 13 ?? 00 11 ?? 6F ?? ?? ?? ?? 16 14 28 ?? ?? ?? ?? 26 28 ?? ?? ?? ?? DE ?? 00 00 00 00 00 00 06 6F 
            ?? ?? ?? ?? 13 ?? 11 ?? 3A ?? ?? ?? ?? DE ?? 06 2C ?? 06 6F ?? ?? ?? ?? 00 DC DE ?? 25 28 ?? ?? ?? ?? 
            13 ?? 00 28 ?? ?? ?? ?? DE ?? 00 03 28 ?? ?? ?? ?? 13 ?? 16 13 ?? 38 ?? ?? ?? ?? 11 ?? 11 ?? 9A 13 ?? 
            00 28 ?? ?? ?? ?? 6F ?? ?? ?? ?? 11 ?? 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 13 ?? 38 ?? ?? ?? ?? 11 ?? 6F ?? 
            ?? ?? ?? 13 ?? 11 ?? 11 ?? 6F ?? ?? ?? ?? 17 DA 6F ?? ?? ?? ?? 28 ?? ?? ?? ?? 72 ?? ?? ?? ?? 16 28 ?? 
            ?? ?? ?? 16 FE ?? 13 ?? 11 ?? 2C ?? 11 ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 28 ?? ?? ?? ?? 16 FE ?? 13 ?? 
            11 ?? 2C ?? 00 02 11 ?? 11 ?? 72 ?? ?? ?? ?? 28 ?? ?? ?? ?? 02 7B ?? ?? ?? ?? 28 ?? ?? ?? ?? 00 11 ?? 
            28 ?? ?? ?? ?? 00 DE ?? 25 28 ?? ?? ?? ?? 13 ?? 00 11 ?? 6F ?? ?? ?? ?? 16 14 28 ?? ?? ?? ?? 26 28 ?? 
            ?? ?? ?? DE ?? 00 00 00 00 00 00 11 ?? 6F ?? ?? ?? ?? 13 ?? 11 ?? 3A ?? ?? ?? ?? DE ?? 11 ?? 2C ?? 11 
            ?? 6F ?? ?? ?? ?? 00 DC DE ?? 25 28 ?? ?? ?? ?? 13 ?? 00 28 ?? ?? ?? ?? DE ?? 00 00 11 ?? 17 D6 13 ?? 
            11 ?? 11 ?? 8E 69 FE ?? 13 ?? 11 ?? 3A ?? ?? ?? ?? 2A 
        }

        $encrypt_files = {
            00 00 03 19 17 73 ?? ?? ?? ?? 0A 04 18 18 73 ?? ?? ?? ?? 0B 73 ?? ?? ?? ?? 0C 08 28 ?? ?? ?? ?? 05 6F 
            ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 08 28 ?? ?? ?? ?? 05 6F ?? ?? ?? ?? 6F ?? ?? ?? ?? 00 08 6F ?? ?? ?? ?? 
            0D 07 09 17 73 ?? ?? ?? ?? 13 ?? 06 6F ?? ?? ?? ?? 17 6A DA B7 17 D6 8D ?? ?? ?? ?? 13 ?? 06 11 ?? 16 
            11 ?? 8E 69 6F ?? ?? ?? ?? 26 11 ?? 11 ?? 16 11 ?? 8E 69 6F ?? ?? ?? ?? 00 11 ?? 6F ?? ?? ?? ?? 00 07 
            6F ?? ?? ?? ?? 00 06 6F ?? ?? ?? ?? 00 DE ?? 25 28 ?? ?? ?? ?? 13 ?? 00 28 ?? ?? ?? ?? DE ?? 00 2A 
        }

    condition:
        uint16(0) == 0x5A4D and 
        (
            (
                all of ($main_ransomware_function_p*)
            ) and
            $search_files and 
            $encrypt_files
        )
}