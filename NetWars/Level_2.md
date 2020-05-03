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