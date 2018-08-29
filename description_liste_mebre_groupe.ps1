$now = get-date -uformat "%y%m%d"
$infoMember = Get-AdgroupMember "SIG REFERENTS" 
$results = @()
foreach ($member in $infoMember) { $results += get-aduser $member.samaccountname -properties * | Select SamAccountName,sn,Name,givenName,mail,DisplayName,title,Company,PasswordExpired,LastLogonDate,LockedOut,PasswordLastSet,whenCreated,distinguishedName}
$results
$results | Export-csv C:\Output\extranet_export_$now.csv -Delimiter ";" -Encoding Unicode
Get-Content C:\Output\extranet_export_$now.csv| Select-Object -Skip 1 | Set-Content C:\Output\ad_member\refereent_export_$now.csv
Remove-Item C:\Output\extranet_export_$now.csv