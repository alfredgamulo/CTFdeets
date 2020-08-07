For GPS:
- https://github.com/Genymobile/gnirehtet
- https://wiki.networksecuritytoolkit.org/nstwiki/index.php?title=HowTo_Use_an_Android_Phone_as_a_GPSd_Source

Have GPSd on phone and laptop
Have gnirehtet and the APK on laptop

on Terminal 1:
```
cp wardriving.conf /etc/kismet/kismet_site.conf
```

on Phone GPSd client:
```
10.0.2.2
9999
```

on Terminal 2:
```
systemctl stop gpsd.socket
gpsd -D9 -N "udp://*:9999"
```

on Terminal 3:
```
./gnirehtet run
```

on Terminal 1:
```
# validate 
gpsmon
^C
kismet
# after collecting
kismetdb_to_wiglecsv --in Kismet-<blah>.kismet --out derp.csv
```
