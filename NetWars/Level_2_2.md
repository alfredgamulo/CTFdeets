# Xeno Origins

### How to find the byte-count of a file?
```
wc -c <file>
# this is the same value as you would see running `ls -l`
```

### How to find the line-count of a file?
```
wc -l <file>
```

### What are some ways to parse the IP address of a access log and find the unique IPs?
```
cat /var/log/access.log | awk -F ' ' '{print $1} | sort | uniq | wc -l
cut -d " " -f 1 /var/log/access.log | sort -u | wc -l
```

### How to find the most common IP address in an access log?
```
cat /var/log/access.log | awk -F ' ' '{print $1} | sort | uniq -c | sort -n
```
