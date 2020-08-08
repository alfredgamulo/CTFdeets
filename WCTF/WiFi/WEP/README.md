sudo airmon-ng

sudo airmon-ng start wlan27

sudo airodump-ng  -w derp --output-format pcap --band ag wlan27mon


# wget https://raw.githubusercontent.com/rfhs/wctf-files/master/wordlist/cyberpunk.words
sudo aircrack-ng -w cyberpunk.words derp0-01.cap

