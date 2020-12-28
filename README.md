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
