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