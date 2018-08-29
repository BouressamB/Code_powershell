$gp  ="SIG REFERENTS"
Get-ADGroupMember -Identity $gp -Recursive | Get-ADUser -Property * | Select mail,DisplayName,title,Company,PasswordExpired,LastLogonDate,LockedOut,PasswordLastSet,whenCreated  | Export-csv -path C:\Output\user_groupe_sig_referent.csv -Encoding Unicode -NoTypeInformation


