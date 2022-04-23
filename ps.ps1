# & .\ps.ps1
#Write-Host "hello"
Remove-Item C:\Users\Z\AppData\Local\nvim -Recurse -Force
Copy-Item nvim -Destination "C:\Users\Z\AppData\Local\nvim\" -Recurse
