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
