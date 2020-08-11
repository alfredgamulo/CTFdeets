hostapd:
```
interface=wlan31mon
ssid=WCTF_04
hw_mode=g
channel=6
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=my_password
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
```

`hostapd [conf file] -d`  for more info


this is helpful for WCTF_04 where you have airodump running.
The client will try to connect to the fake host set up with hostapd.
The process initiates a 4-way handshake and 3 parts of the 4-way handshake is enough for aircrack.

^ this same process is useful for WCTF_04 but has an added step of needing mdk4 to knock of the real host.

