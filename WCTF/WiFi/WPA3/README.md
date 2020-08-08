To find the target:

```
airmon-ng # to list interfaces (nic)
airmon-ng start [nic]
airodump-ng [nicmon] --band ag
# use -c 161 to specify channel
airmon-ng stop [nicmon]
```

These should help you find the BSSID and ESSID for for the brute script.
We choose the one that has higher channel (161) because it's 5g and faster in real world scenarios.