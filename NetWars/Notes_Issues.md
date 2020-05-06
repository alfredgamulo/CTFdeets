1. Syntax incorrect `&Hat;` -> `^`
2. Science cron not actually running
3. Powershell CreationTime has different format depending on the way its found.
    `(Get-Item "Path").CreationTime` vs `Get-Item "Path" | Select-Object {$_.CreationTime}`

