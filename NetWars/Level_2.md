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

