#!/bin/bash

echo "sudo airmon-ng check kill"
sudo airmon-ng check kill

echo "starting wlan0"

echo "sudo airmon-ng start wlan0"
sudo airmon-ng start wlan0

echo "......."
echo "......."
echo "Environment scan is next. Press Enter then CTRL+C to stop scan."
read TEMP

sudo airodump-ng -i wlan0mon

#echo "ifconfig"
#ifconfig

echo "Enter all or part of the ESSID to Filter ->"
read FILTER

echo "Enter channel (blank to scan) ->"
read CHANNEL

TIME=$( date +%H,%M,%S,%Y.%m.%d)
echo "$TIME"

PRE=""

if [ -z "$CHANNEL" ]
then
  PRE="scan"
  echo "sudo airodump-ng -w $PRE-$TIME --output-format --essid-regex $FILTER* pcap wlan0mon --band abg"
  sudo airodump-ng -w "$PRE-$TIME" --output-format pcap --essid-regex "$FILTER*" wlan0mon --band abg
else
  PRE="chan$CHANNEL"
  echo "sudo airodump-ng -w $PRE-$TIME --output-format --essid-regex $FILTER* pcap wlan0mon -c $CHANNEL"
  sudo airodump-ng -w "$PRE-$TIME" --output-format pcap --essid-regex "$FILTER*" wlan0mon -c $CHANNEL
fi

sudo airmon-ng stop wlan0mon

sudo ifconfig wlan0 up

echo "Results saved in $PRE-$TIME.pcap"
echo ""

