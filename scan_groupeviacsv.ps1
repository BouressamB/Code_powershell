  set-location $pathDev

$csvImport = Import-Csv "C:\Output\liste_groupe_cecile.csv"
$results = @()
ForEach ($item in $csvImport)

{

$name = $item.Name


Write-host $name

$now = get-date -uformat "%y%m%d"

$infoMember = Get-AdgroupMember "$name" 

foreach ($member in $infoMember) { $results += get-aduser $member.samaccountname -properties * | Select SamAccountName,sn,Name,givenName,mail,DisplayName,title,Company,PasswordExpired,LastLogonDate,LockedOut,PasswordLastSet,whenCreated,distinguishedName,@{Name='Groupe';Expression={$name}}}
}
$results | Export-csv C:\Output\extranet_export_ad_$now.csv -Delimiter ";" -Encoding Unicode

