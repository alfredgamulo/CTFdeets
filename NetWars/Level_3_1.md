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
