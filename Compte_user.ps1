Get-ADUser -Filter * -SearchBase "OU=Communes,OU=Utilisateurs Externes,DC=casa,DC=priv" -property * | foreach {
$member++
}
Write-Host $member " in " $gp