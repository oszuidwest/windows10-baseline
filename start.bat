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
:: Download and apply GPO baseline settings
::===============================================================

curl -o C:\Windows\deploy\LGPO.exe https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/bin/LGPO.exe

curl -o C:\Windows\deploy\userpol.txt https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/gpo/userpol.txt
curl -o C:\Windows\deploy\syspol.txt https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/gpo/syspol.txt 
curl -o C:\Windows\deploy\firefoxpol.txt https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/gpo/firefoxpol.txt
curl -o C:\Windows\deploy\edgepol.txt https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/gpo/edgepol.txt 

START C:\Windows\deploy\LGPO.exe /r C:\Windows\deploy\userpol.txt /w C:\Windows\deploy\userpol.pol
START C:\Windows\deploy\LGPO.exe /r C:\Windows\deploy\syspol.txt /w C:\Windows\deploy\syspol.pol
START C:\Windows\deploy\LGPO.exe /r C:\Windows\deploy\firefoxpol.txt /w C:\Windows\deploy\firefoxpol.pol
START C:\Windows\deploy\LGPO.exe /r C:\Windows\deploy\edgepol.txt /w C:\Windows\deploy\edgepol.pol

::===============================================================
:: Debloat Windows 10
::===============================================================

curl -o C:\Windows\deploy\debloat.ps1 https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/scripts/debloat.ps1 
CALL sudo.bat powershell.exe -executionpolicy unrestricted -file "C:\Windows\deploy\debloat.ps1"