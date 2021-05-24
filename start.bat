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

curl -o C:\Windows\deploy\time.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/scripts/time.bat
curl -o C:\Windows\deploy\power.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/scripts/power.bat 

CALL sudo.bat C:\Windows\deploy\time.bat
CALL sudo.bat C:\Windows\deploy\power.bat

::===============================================================
:: Download and apply GPO baseline settings
::===============================================================

curl -o C:\Windows\deploy\gpo.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/scripts/gpo.bat 

CALL sudo.bat C:\Windows\deploy\gpo.bat

::===============================================================
:: Instal package manager
::===============================================================

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

::===============================================================
:: Instal baseline apps
::===============================================================

curl -o C:\Windows\deploy\apps.bat https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/scripts/apps.bat
CALL sudo.bat C:\Windows\deploy\apps.bat

::===============================================================
:: Debloat Windows 10
::===============================================================

curl -o C:\Windows\deploy\debloat.ps1 https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/scripts/debloat.ps1 
CALL sudo.bat powershell.exe -executionpolicy unrestricted -file "C:\Windows\deploy\debloat.ps1"