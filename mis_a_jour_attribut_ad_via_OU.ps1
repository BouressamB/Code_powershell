$users = Get-ADUser -Filter * -SearchScope Subtree -SearchBase "OU=Direction Générale des Services,OU=CASA,OU=Utilisateurs,DC=casa,DC=priv" | Select-Object DistinguishedName, SamAccountName
$value = "@agglo-casa.fr"

#$users = Get-ADUser -identity "Arubatest2" | Select-Object DistinguishedName, SamAccountName
#$value = "@agglo-casa.fr"

foreach ($i in $users)
{
$ext = ($i.SamAccountName) + $value
$ext2 = ($i.extensionAttribute1)
Write-Host "extensionAttribute2:", $ext2

$id = $i.DistinguishedName
$user = Get-ADUser -Identity $id -Properties extensionAttribute2
Write-Host "Avant extensionAttribute2:", $ext , " - " , $User.extensionAttribute2 
$User.extensionAttribute2 = "Mail Exchange CASA"
Set-ADUser -Instance $User
Write-Host "Aprés extensionAttribute2:", $ext , " - " , $User.extensionAttribute2 
}

