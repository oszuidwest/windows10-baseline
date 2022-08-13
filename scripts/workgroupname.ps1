$regname = Get-ItemPropertyValue -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name _deploy_computer_name
$curname = (Get-CimInstance -ClassName Win32_ComputerSystem).Name
if ( $curname -ne $regname )
{
Rename-Computer -NewName "$regname" -Force
}
Add-Computer -WorkGroupName oszw
