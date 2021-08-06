# WiFi

notes from old cons:

| Challenge             | Scenario                                                                           | BSSID               | Channel | Solution
|-----------------------|------------------------------------------------------------------------------------|---------------------|---------|------------
| WCTF_00               | Log in to AP                                                                       | 60:E3:27:AD:ED:6D   | 11      |
| WCTF_01               | WEP, 128-bit, 30 ARP                                                               | 62:E3:27:AD:ED:6D   |         | fakeoff to keep connected, start and forget
| WCTF_02               | WEP, 5 GHz, no client                                                              |                     |         | https://www.aircrack-ng.org/doku.php?id=how_to_crack_wep_with_no_clients  https://quickfixpei.ca/projects/wifi/wep/wep2.html#step1
| WCTF_03               | WEP client, no AP                                                                  |                     |         | Caffee latte. "run replay" or start a hostapd
| WCTF_04               | WPA, client comes and goes.                                                        | 66:E3:27:AD:ED:6D   | 11      | Create an AP, watch for 4-way handshake where 3 parts is sufficient to crack
| WCTF_05               | WPA, stable clients                                                                | 6A:E3:27:AD:ED:6D   | 11      | need to deauth, mdk3, directed deauth
| WCTF_06               | WPA, no client                                                                     |                     |         | put up access point, need airbase. Opposite of 04
| WCTF_07               | WPA, 802.11w                                                                       | 6E:E3:27:AD:ED:6D   |         | capture startup
| WCTF_08               | WPA, 802.11r, dual band, fast transition, deauth doesn't result in new handshake.  | 72:E3:27:AD:ED:6D   |         | "capture first startup? Need to for the client to try to connect to different WAP, when fails will fall back to acutal WAP with renegotiate connection"
| WCTF_09               | WPA, 802.11rw Rapid and deauth protection                                          | 76:E3:27:AD:ED:6D   |         | capture startup
| WCTF_10               | WEP, 64-bit                                                                        | 7A:E3:27:AD:ED:6D   | 11      | Run aircrack with -n 64 command
| WCTF-11               | WPS, 5GHz                                                                          |                     |         | pixie dust
| WCTF-11               | Hidden SSID on channel 149                                                         |                     |         |
| WCTF_12               | Open, 802.11ac only                                                                |                     |         | login with phone
| WCTF_12               | Open, 802.11ac only                                                                |                     |         | connect, give self IP and go to webserver
| WCTF_13               | WPA, no client                                                                     |                     |         | pmkid attack
| WCTF_14               | Open                                                                               |                     |         | client checking email
| WCTF_15               | transition mode                                                                    |                     |         | 
| WCTF_PMKID_11r_TEST   |                                                                                    | C8:B5:AD:FF:21:03   | 6       |
| WCTF_PMKID_TEST       |                                                                                    | C8:B5:AD:FF:21:02   | 6       |
| OPEN_CTF              |                                                                                    | C8:B5:AD:FF:21:00   | 6       |
| WCTF_WPA              |                                                                                    | 34:FC:B9:74:CF:C2   |         |
| WCTF_WEP              |                                                                                    | 34:FC:B9:74:CF:C1   |         |


## Bands
802.11a (Sep 1999):
* 5GHz: 54Mbps

802.11b (Sep 1999):
* 2.4GHz: 11Mbps

802.11g (June 2003):
* 2.4GHz: 54Mbps

802.11n (Oct 2009):
* 5 or 2.4 GHz: 450 to 600Mbps

802.11ac (Jan 2014):
* 5GHz: 1.3Gbps

802.11ax (late 2019):
* 4x throughput

## quick commands:

`iw dev`

`iw wlan32mon set type managed`

`iw wlan32mon set channel 44`

`ifconfig wlan32mon up/down`

how to connect to an open AP?

`iw dev <interface> connect <AP> <frequency>`

make sure that interface is up "ifconfig <interface> up"
