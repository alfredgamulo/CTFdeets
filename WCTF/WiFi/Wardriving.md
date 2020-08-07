cp wardriving.conf /etc/kismet/kismet_site.conf

For GPS:
- https://github.com/Genymobile/gnirehtet
- https://wiki.networksecuritytoolkit.org/nstwiki/index.php?title=HowTo_Use_an_Android_Phone_as_a_GPSd_Source

Have GPSd on phone and laptop
Use gnirehtet (autorun?) to reverse-tether the laptop to the phone, so that the phone gets the laptop IP.

systemctl stop gpsd.socket
gpsd -D9 -N "udp://*:9999"
or
gpsd -D9 -N udp://192.168.1.229:9999


run kismet

