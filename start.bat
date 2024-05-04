::===============================================================
:: Set variables
::===============================================================

@echo off
set /p _deploy_computer_purpose= "Kies type systeem: fm, edit, redactie, laptop of plain    "
setx _deploy_computer_purpose "%_deploy_computer_purpose%" /m
set /p _deploy_user_password= "Geef het wachtwoord voor de gebruiker in    "
setx _deploy_user_password "%_deploy_user_password%" /m
set /p _deploy_computer_name= "Vul computernaam in    "
setx _deploy_computer_name "%_deploy_computer_name%" /m

::===============================================================
:: Cleanup directory
::===============================================================

if exist "C:\Windows\deploy\" rmdir /s /q C:\Windows\deploy
if not exist "C:\Windows\deploy\" mkdir C:\Windows\deploy

::===============================================================
:: Install sudo
::===============================================================

curl -o C:\Windows\sudo.bat https://raw.githubusercontent.com/zh0ul/sudo.bat/master/sudo.bat

::===============================================================
:: Set time and power
::===============================================================

curl -o C:\Windows\deploy\ntptime.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/ntptime.bat
curl -o C:\Windows\deploy\powerconf.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/powerconf.bat

CALL sudo.bat C:\Windows\deploy\ntptime.bat
CALL sudo.bat C:\Windows\deploy\powerconf.bat

::===============================================================
:: Set wallpaper
::===============================================================

:: curl -o C:\Windows\deploy\wallpaper.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/wallpaper.bat
:: CALL sudo.bat C:\Windows\deploy\wallpaper.bat

::===============================================================
:: Add users
::===============================================================

curl -o C:\Windows\deploy\users.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/users.bat
CALL sudo.bat C:\Windows\deploy\users.bat

::===============================================================
:: Add start menu (it's enabled by a GPO)
::===============================================================

:: curl -o C:\Windows\deploy\startmenu.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/startmenu.bat
:: CALL sudo.bat C:\Windows\deploy\startmenu.bat

::===============================================================
:: Set workgroup and name
::===============================================================

curl -o C:\Windows\deploy\workgroupname.ps1 https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/workgroupname.ps1
CALL sudo.bat powershell.exe -executionpolicy unrestricted -file "C:\Windows\deploy\workgroupname.ps1"

::===============================================================
:: Download and apply GPO settings
::===============================================================

:: curl -o C:\Windows\deploy\gpo.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/gpo.bat
:: CALL sudo.bat C:\Windows\deploy\gpo.bat

::===============================================================
:: Install package manager
::===============================================================

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

::===============================================================
:: Install apps
::===============================================================

:: curl -o C:\Windows\deploy\apps.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/apps.bat
:: CALL sudo.bat C:\Windows\deploy\apps.bat

::===============================================================
:: Debloat Windows 10
::===============================================================

:: curl -o C:\Windows\deploy\debloat.ps1 https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/debloat.ps1
:: curl -o C:\Windows\deploy\onedrive.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/windows-11/scripts/onedrive.bat
:: CALL sudo.bat powershell.exe -executionpolicy unrestricted -file "C:\Windows\deploy\debloat.ps1"
:: CALL sudo.bat C:\Windows\deploy\onedrive.bat
