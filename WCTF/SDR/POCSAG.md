```
multimon:
	Available demodulators: POCSAG512 POCSAG1200 POCSAG2400 FLEX EAS UFSK1200 CLIPFSK FMSFSK AFSK1200 AFSK2400 AFSK2400_2 AFSK2400_3 HAPN4800 FSK9600 DTMF ZVEI1 ZVEI2 ZVEI3 DZVEI PZVEI EEA EIA CCIR MORSE_CW DUMPCSV X10



nc -l -u -k localhost 7355 | sox -t raw -esigned-integer -b16 -r 48000 - -esigned-integer -b 16 -r 22050 -t raw - | multimon-ng -t raw -a FLEX -a POCSAG512 -a MORSE_CW -a AFSK1200 -a AFSK2400 -a POCSAG1200 -a POCSAG2400 -f alpha -v1 -
```

For DefCon Safemode, put a file sink module after the ZMQ SUB Source.
Record the file by executing the flow graph.
Open the recorded file into GQRX and set the input rate to 96000.
Set the UDP pipe in gqrx and the messages should show up on the terminal where netcat is listening.
