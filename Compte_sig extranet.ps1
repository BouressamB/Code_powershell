$gp  ="SIG EXTRANET"
Get-ADGroupMember -Identity $gp | foreach {
$member++
Set-ADAccountExpiration -DateTime "15/01/2018"
}
Write-Host $member "utilisateurs dans " $gp