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
