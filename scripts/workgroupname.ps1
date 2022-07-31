$regname = Get-ItemPropertyValue -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name _deploy_computer_name
Add-Computer -WorkGroupName oszw
Rename-Computer -NewName "$regname" -Force