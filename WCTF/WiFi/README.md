WiFi

notes from old cons:
```
Challenge    Scenario    BSSID    Channel    Flag    Solution
WCTF_00    Log in to AP    60:E3:27:AD:ED:6D    11    Vegas Vice    Gimme
WCTF_01    "WEP, 128-bit, 30 ARP
"    62:E3:27:AD:ED:6D            fakeoff to keep connected, start and forget
WCTF_02-solved    WEP, 5 GHz, clientless                https://www.aircrack-ng.org/doku.php?id=how_to_crack_wep_with_no_clients
WCTF_03-solved    WEP client, no AP                Caffee latte, run replay
WCTF_04 wep    WPA, client comes and goes    66:E3:27:AD:ED:6D    11        switch with 1, watch for handshake
WCTF_05    WPA, stable clients    6A:E3:27:AD:ED:6D    11        need to deauth, mdk3, directed deauth
WCTF_06 wep    WPA, no client                put up access point, need airbase
WCTF_07-solved    WPA, 802.11w    6E:E3:27:AD:ED:6D            capture startup
WCTF_08    "WPA, 802.11r, dual band, fast transition,
deauth does not result in new handshake"    72:E3:27:AD:ED:6D            capture first startup? Need to for the client to try to connect to different WAP, when fails will fall back to acutal WAP with renegotiate connection
WCTF_09-solved    WPA, Rapid and deauth protection    76:E3:27:AD:ED:6D            "capture startup
"
WCTF_10-solved    WEP, 64-bit    7A:E3:27:AD:ED:6D    11        Run aircrack with -n 64 command
WCTF-11-SOLVED    WPS, 5GHz                pixie dust
WCTF_12-wpa2    Open, 802.11ac only                login with phone

WCTF_PMKID_11r_TEST        C8:B5:AD:FF:21:03    6
WCTF_PMKID_TEST        C8:B5:AD:FF:21:02    6
OPEN_CTF        C8:B5:AD:FF:21:00    6
WCTF_WPA        34:FC:B9:74:CF:C2
WCTF_WEP        34:FC:B9:74:CF:C1
```



#airmon-ng stop wlan32mon

PHY     Interface       Driver          Chipset

phy32   wlan32mon       mac80211_hwsim  Software simulator of 802.11 radio(s) for mac80211


You are trying to stop a device that isn't in monitor mode.
Doing so is a terrible idea, if you really want to do it then you
need to type 'iw wlan32mon del' yourself since it is a terrible idea.
Most likely you want to remove an interface called wlan[0-9]mon
If you feel you have reached this warning in error,


broke?

iw dev

 #iw wlan32mon set type managed