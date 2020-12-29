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
* `smbclient` try to connect to it and try the individual sharenames in the server path

Search for exploits on the services/ports and versions that were found:
* https://www.exploit-db.com/
* https://www.rapid7.com/db/

Other scanning tools:
* `masscan -p1-65535 --rate 1000 <ip addr>` this tool scans the whole internet, make sure to specify ip so that you're not hitting disallowed servers
* `msf5 > search portscan` use scanning options from metasploit
* https://www.tenable.com/downloads/nessus
