Get-ADUser -Filter * -SearchBase "OU=Utilisateurs,DC=casa,DC=priv" -property * | Get-ADUser -Property * | Select Name,DisplayName,title,department,DistinguishedName | Export-csv -path C:\SCRIPT_POWERSHELL\liste_ad_utilisateur.csv -Encoding Unicode -NoTypeInformation