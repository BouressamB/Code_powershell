$gp  ="TESTECHANGEMENTDEMOTSDEPASSE"
Get-ADGroupMember -Identity $gp | Set-ADAccountPassword -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "2password!" -Force)
