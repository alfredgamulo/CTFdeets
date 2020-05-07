# Powershell

### What powershell command can be used to find json files?
```
Get-ChildItem -Path "/Windows" -Filter *.json -r
```

### How do you print the contents of a file?
```
Get-Content /File/path
```

### How do you find the count of all subdirectories?
```
(gci -Path /Windows -r -Directory).Length
```

### How do you list the environment variables?
```
$env
```

### How do you list the Powershell variables?
```
$variable:
```

### How do you find a file matching a regex pattern?
```
Get-ChildItem -Path "/Windows" -File -r | Where-Object { $_.Name -match 'wiki' }
# This match is case-insensitive
```

### How do you grep a file for matching content?
```
Get-ChildItem -File -r | Select-String 'wiki' | Format-Table -GroupBy Path
```

### How do you Base64 decode a string?
```
[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String(<string>))
```

### How do you list the processes?
```
Get-Process
```

### How do you get the parent of a process?
```
Get-Process | Select Name,Parent
```

### How do you edit and place a file in powershell?
```
(Get-Content) /old/path -Raw) -replace 'before','after' | Set-Content /new/path
```

### How do you search for commands in powershell?
```
Get-Command | Select-String "archive"
```

### How do you read an xml file?
```
$logs = (Import-Clixml /tmp/Security/Security.xml); $logs.length
```

