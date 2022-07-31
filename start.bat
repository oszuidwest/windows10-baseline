::===============================================================
:: Set variables
::===============================================================

@echo off
set /p _deploy_computer_purpose= "Kies type systeem: fm, edit, redactie, laptop of plain    "
setx _deploy_computer_purpose "%_deploy_computer_purpose%" /m
set /p _deploy_user_password= "Geef het wachtwoord voor de gebruker in    "
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

curl -o C:\Windows\deploy\ntptime.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/scripts/ntptime.bat
curl -o C:\Windows\deploy\powerconf.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/scripts/powerconf.bat

CALL sudo.bat C:\Windows\deploy\ntptime.bat
CALL sudo.bat C:\Windows\deploy\powerconf.bat

::===============================================================
:: Set wallpaper
::===============================================================

curl -o C:\Windows\deploy\wallpaper.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/scripts/wallpaper.bat
CALL sudo.bat C:\Windows\deploy\wallpaper.bat

::===============================================================
:: Add users
::===============================================================

curl -o C:\Windows\deploy\users.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/scripts/users.bat
CALL sudo.bat C:\Windows\deploy\users.bat

::===============================================================
:: Add start menu (it's enabled by a GPO)
::===============================================================

curl -o C:\Windows\deploy\startmenu.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/scripts/startmenu.bat
CALL sudo.bat C:\Windows\deploy\startmenu.bat

::===============================================================
:: Set workgroup and name
::===============================================================

curl -o C:\Windows\deploy\workgroup.ps1 https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/scripts/workgroupname.ps1
CALL sudo.bat powershell.exe -executionpolicy unrestricted -file "C:\Windows\deploy\workgroupname.ps1"

::===============================================================
:: Download and apply GPO settings
::===============================================================

curl -o C:\Windows\deploy\gpo.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/scripts/gpo.bat
CALL sudo.bat C:\Windows\deploy\gpo.bat

::===============================================================
:: Install package manager
::===============================================================

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

::===============================================================
:: Install apps
::===============================================================

curl -o C:\Windows\deploy\apps.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/scripts/apps.bat
CALL sudo.bat C:\Windows\deploy\apps.bat

::===============================================================
:: Debloat Windows 10
::===============================================================

curl -o C:\Windows\deploy\debloat.ps1 https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/scripts/debloat.ps1
CALL sudo.bat powershell.exe -executionpolicy unrestricted -file "C:\Windows\deploy\debloat.ps1"
