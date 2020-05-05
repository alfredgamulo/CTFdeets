# XenoMalware

### What is a powershell invocation to output piped data to a file?
```
<function/script> | Out-File <filename>
```

### How do you find the parent of a process?
When running a command like `ps -ef`, the PID is the Process ID label. In another column, the PPID is the Process ID of the parent process.
An easy way to know which is the PID and which is the PPID when looking at an exerpt of a process list is to know that the parent process may usually have smaller values than the process.

### What an example command of killing a list of processes?
```
 sudo kill -9 $(ps -aux | grep -E 'science|xeno' | grep -v grep | awk '{print $2}') 
```

### How do you find system service hierarchy and the way processes run and start?
```
systemctl status
```

### How to list and edit cron jobs?
```
crontab -l
crontab -e
```
