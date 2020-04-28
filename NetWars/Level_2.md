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
