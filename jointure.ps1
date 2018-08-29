$hier = get-date -date ((get-date).AddDays(-1)) -uformat "%y%m%d"
$now = get-date -uformat "%y%m%d"
$L= Import-Csv C:\Output\ad_member\extranet_export_$hier.csv
$R= Import-Csv C:\Output\ad_member\extranet_export_$now.csv
. "C:\Output\Join_Object.ps1"
$results = @()
$results = Join-Object -Left $L -Right $R -LeftJoinProperty SamAccountName -RightJoinProperty SamAccountName -Type AllInBoth -Prefix r_ 
$results | ForEach-Object { If ($_.SamaccountName){If ($_.r_SamaccountName){}else{Echo "Supprimer  $($_.r_SamaccountName)"}}else{Echo "Rajouter  $($_.r_SamaccountName)"} }
