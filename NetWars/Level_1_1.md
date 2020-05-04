# Intro

NOST_DIAGS.txt:
```
       _   _  ____   _____ _______ _____   ____  __  __  ____         
      | \ | |/ __ \ / ____|__   __|  __ \ / __ \|  \/  |/ __ \        
      |  \| | |  | | (___    | |  | |__) | |  | | \  / | |  | |       
      | . ` | |  | |\___ \   | |  |  _  /| |  | | |\/| | |  | |       
      | |\  | |__| |____) |  | |  | | \ \| |__| | |  | | |__| |       
  ____|_|_\_|\____/|_____/__ |_| _|_|__\_\\____/|_|__|_|\____/ _____  
 |  __ \_   _|   /\   / ____| \ | |/ __ \ / ____|__   __|_   _/ ____| 
 | |  | || |    /  \ | |  __|  \| | |  | | (___    | |    | || |      
 | |  | || |   / /\ \| | |_ | . ` | |  | |\___ \   | |    | || |      
 | |__| || |_ / ____ \ |__| | |\  | |__| |____) |  | |   _| || |____  
 |_____/_____/_/____\_\_____|_|_\_|\____/|_____/ __|_|__|_____\_____| 
              |  __ \|  ____|  __ \ / __ \|  __ \__   __|             
              | |__) | |__  | |__) | |  | | |__) | | |                
              |  _  /|  __| |  ___/| |  | |  _  /  | |                
              | | \ \| |____| |    | |__| | | \ \  | |                
              |_|  \_\______|_|     \____/|_|  \_\ |_|                
 ___________________________________________________________________
|  _______________________________________________________________  |
| |                                                               | |
| |   Report filename      /home/ellen/Desktop/NOST_DIAGS.txt     | |
| |   Manufacturer         Wey-Tech Corp.                         | |
| |   Product Line         Lockmart                               | |
| |   Model                CM-88B Bison                           | |
| |   Class                M-Class starfreighter                  | |
| |_______________________________________________________________| |
|___________________________________________________________________|

[Installed Software]
  aircrack-ng                   
  burp                          /pentest/exploitation/burp
  CeWL
  curl
  gimp
  hydra
  inotify
  libreoffice
  metasploit                    /pentest/exploitation/metasploit
  netcat
  nikto                         /pentest/vulnerability-analysis/nikto
  nmap
  socat
  sqlmap                        /pentest/exploitation/sqlmap
  tcpdump
  tmux
  volatility
  wireshark
  code	                        # Visual Studio Code Editor
  setoolkit
  wpscan

[Section Dedicated to Large Text Files Full of Words]
  /home/ellen/rockyou.txt

NetWars{WhereAmIWhoAmI}

```

### What's the OS?
```
cat /etc/*rel*
lsb_release -a
uname -a
```

### Who are you?
```
whoami
```

### What is the hostname?
```
hostname
```

### Who else uses the computer?
```
cat /etc/passwd
```

# Diagnostics

### Show environment variables
```
env
```

### What is the gecos field?
In the `/etc/passwd` file, it is typically used to record general information about the account or its user(s) such as their real name and phone number. 

The typical format for the GECOS field is a comma-delimited list with this order:

1. User's full name (or application name, if the account is for a program)
2. Building and room number or contact person
3. Office telephone number
4. Home telephone number
5. Any other contact information (pager number, fax, external e-mail address, etc.)

In most UNIX systems non-root users can change their own information using the chfn or chsh command. 

### How do you assume another user?
```
su - jonesy
```

### How do you show all files in a directory?
```
find . -type f
```

### How to list available sudo permissible commands?
```
sudo -l
```

### How to assume another user in a sudo command?
```
sudo -u guest /usr/bin/strings * /opt/guest/guest.blob
```

### How to pring strings with different encoding?
```
strings -h
strings -e b guest.blob | grep Net
```

### How to list processes?
```
ps -ef | grep Net
```

### How to find full path of a command?
```
which
```

### How to view the command history?
```
history | less
```

### How to recursively grep a pattern for a subset of filetypes or filenames?
```
find . -name *.java -type f | xargs grep -Rsni pass
```

### How to show differences in two files?
```
diff
```

### What is a sticky bit and how do you set it?
A Sticky bit is a permission bit that is set on a file or a directory that lets only the owner of the file/directory or the root user to delete or rename the file. No other user is given privileges to delete the file created by some other user.
```
chmod 1400
```