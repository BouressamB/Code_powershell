$strIP = "172.16.7.15"
$strComputer = (Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName $strIP).pscomputername 
$Var =GWMI -Comp $strComputer -CL Win32_ComputerSystem
" User Name: " + $Var.UserName 
