# Engineering Traffic

### How to export pcap objects?
Open the pcap in Wireshark.

Wireshark has an export http option.

`wireshark /opt/engineering/pcap_samples/capture1.pcap &` will open the pcap in Wireshark.

Then:
* File -> Export Objects -> HTTP
* Select Filename ads?client etc...
* Select Save and save somewhere on the system.

`md5sum /path/you/chose/to/ads` will give you the MD5 hash of the file.

### How to read email from pcap?
Right-click the SMTP packet and click Follow TCP-Stream

### How do you filter to find a file by name?
For SMB packets where a file was listed, filter with:
```
smb.file contains EVIL
```
Clicking this filtered packet can show you file information.

### How to filter by http request type?
```
http.request.method == POST
```

### How to filter with tshark?
```
tshark -r capture5.pcap -Y "http.request.method == POST" -T fields -e urlencoded-form.value
```

### What is a wireshark filter you can use to view HTTP response content?
```
http.file_data
```

### What is remote file inclusion?
Remote file inclusion attacks usually occur when an application receives a path to a file as input for a web page and does not properly sanitize it.

### Show examples of what a SQL Injection might look like
```
admin' -- -

' or 1=1--
```

### Show an example of what server-side Javascript Injection might look like
The following could be posted to an API where the `$ne` syntax would get evaluated by Mongo:
```
{"username":"admin","password":{"$ne":"intentionallynotpassword"}}
```

### How do you find the WEP password of out of a pcap file?
```
aircrack-ng capture10.pcap
```

### How do you find the pre-shared key of a WPA network from a pcap file?
```
aircrack-ng -a 2 -w ~/rockyou.txt capture11.pcap
# -a is to specify attack mode, 1 for WEP and 2 for WPA
# -w specify the wordlist
```

### What is an ICMP tunnel?
In some situations a firewall has been set up to filter ports and services, setting strong egress access controls. Getting a reverse TCP shell is not trivial to get. Sometimes, ICMP is not explicitly blocked. `icmpsh` is a tool that can create an ICMP tunnel connecting a slave (target) with a master (attacker) machine.

### How to find ICMP tunnel information in Wireshark?
```
data && icmp.type == 0
# Type 0 = Echo Reply.
# Type 8 = Echo Request.
# Type 9 = Router Advertisement.
# Type 10 = Router Solicitation.
# Type 13 = Timestamp Request.
# Type 14 = Timestamp Reply.
```

### What is a generic tshark script to filter data from a pcap file?
```
tshark -r capture.pcap -Y '<your wireshark filter here>' -T fields -e <field name>
```

### How to find ICMP tunnel information with tshark?
```
tshark -r capture12.pcap -Y data -T fields -e data | xxd -r -p
```

### How to find the payload in a DNS tunnel with tshark?
```
tshark -r capture13.pcap -Y "dns.resp.type" -T fields -e dns.txt | xxd -r -p
or
tshark -r capture13.pcap -Y 'dns.flags == 0x8400' -T fields -e dns.txt | xxd -r -p > /tmp/newfile.ps1
```

### How to recover file hidden and obfuscated as query parameters in tshark?
```
tshark -r capture14.pcap -Y 'http.request.uri contains bkdoorupld' -T fields -e http.request.uri.query.parameter | awk -F '[,=]' '{print $2}' | xxd -r -p > /tmp/obfuscated.file
file /tmp/obfuscated.file # to find out how to open the file
```

### How to script with pexpect and python subprocess?
```
#!/usr/bin/env python3

import base64
import codecs
import pexpect
import subprocess

c = pexpect.spawnu('sudo MUTHUR')
c.expect('INTERFACE 2037 READY FOR INQUIRY')
print(c.after)
c.sendline('eng')
c.expect('\[i\] Would you like to initiate hydraulic pumps for alignment repair\?')
print(c.after)
c.sendline('yes')

#1 LWOSIDHFB - 43561
#2 hex - 34919
#3 b64 - 51492
#4 rot13 - 23151
# 1 4 3 2

# c.expect('\[i\] Pump 1 Started on port 43561...')
# print(c.after)
# c.expect('\[i\] Pump 2 Started on port 34919...')
# print(c.after)
# c.expect('\[i\] Pump 3 Started on port 51492...')
# print(c.after)
c.expect('\[i\] Pump 4 Started on port 23151...')
print(c.after)

# print("Calling pump 1")
code = 'LWOSIDHFB'
command = "nc localhost 43561"
process = subprocess.Popen(command.split(), stdout=subprocess.PIPE, stdin=subprocess.PIPE)
output, error = process.communicate((code+"\n").encode())
code = output.decode()
print("1 got:", code)
rot = codecs.encode(code, 'rot_13')
print(rot)

# print("Calling pump 4")
command = "nc localhost 23151"
process = subprocess.Popen(command.split(), stdout=subprocess.PIPE, stdin=subprocess.PIPE)
output, error = process.communicate((rot+"\n").encode())
code = output.decode()
print("4 got:", code)
b = base64.b64encode(bytes(code, 'utf-8')).decode('utf-8')
print(b)

# print("Calling pump 3")
command = "nc localhost 51492"
process = subprocess.Popen(command.split(), stdout=subprocess.PIPE, stdin=subprocess.PIPE)
output, error = process.communicate((b+"\n").encode())
code = output.decode()
print("3 got:", code)
h = codecs.encode(code.encode(), 'hex').decode()
print(h)

# print("Calling pump 2")
command = "nc localhost 34919"
process = subprocess.Popen(command.split(), stdout=subprocess.PIPE, stdin=subprocess.PIPE)
output, error = process.communicate((h+"\n").encode())
code = output.decode()
print("2 got:", code)
exit()
```
Alternatively, all the subprocess scripting was possible with a bash one-liner:
```
echo "OVERRIDECODEFOUNDINPDF" | nc localhost 43561 | rot13 | nc localhost 23151 | base64 | nc localhost 51492 | xxd -p | nc localhost 34919
```
