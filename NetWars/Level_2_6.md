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

### How do you find unique xml objects in powershell?
```
$xml_cli.Id | group
```

### How do you make an http call in powershell?
```
(Invoke-WebRequest -Uri http://127.0.0.1:9999/35 -Method POST -Body $pdata).RawContent
```

### How do you connect to a TCP endpoint and read/write? 
```
$FTPServer = "localhost"                                                                                                                  
$FTPPort = 55555                                                                                                                          
$tcpConnection = New-Object System.Net.Sockets.TcpClient($FTPServer, $FTPPort)                                                            
$tcpStream = $tcpConnection.GetStream()                                                                                                   
$reader = New-Object System.IO.StreamReader($tcpStream)                                                                                   
$writer = New-Object System.IO.StreamWriter($tcpStream)                                                                                   
$writer.AutoFlush = $true                                                                                                                 
$buffer = new-object System.Byte[] 1024                                                                                                   
$encoding = new-object System.Text.AsciiEncoding                                                                                          
                                                          
$tcpConnection.Connected                                                      

$writer.WriteLine("is this even working?")                                                                                                                       
while(($reader.Peek() -ne -1) -or ($tcpStream.Available)){write-host ([char]$reader.Read()) -NoNewline}
```

### What is `getfattr`?
It is a way to see NTFS extended file attributes
For example, `getfattr -R -n ntfs.streams .` will show a hidden file.
More information on NTFS Streams:
Ever since Windows 2000, the NTFS file system in Windows has supported Alternate Data Streams, which allow you to store data behind" a filename with the use of a stream name. It's not detectable while browsing the file system, or anywhere within Windows… you can only access it with the "secret key" which is really just the name of the stream.

### If you find a hidden NTFS stream how do you get the contents?
```
> getfattr -R -n ntfs.streams.list ./xenomorph.txt | Select-Object
# file: xenomorph.txt
ntfs.streams.list="muthur_comms_log.db"
> gc ./xenomorph.txt:muthur_comms_log.db
\Program Files (x86)\Mozilla Firefox\gmp-clearkey\0.1\32th234.zip
```
