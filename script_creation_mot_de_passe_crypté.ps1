Read-Host "Enter Password" -AsSecureString |  ConvertFrom-SecureString | Out-File "C:\Logs\cred.txt"

