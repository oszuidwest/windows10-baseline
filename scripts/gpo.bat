curl -o C:\Windows\deploy\LGPO.exe https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/bin/LGPO.exe

curl -o C:\Windows\deploy\userpol.txt https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/gpo/userpol.txt
curl -o C:\Windows\deploy\syspol.txt https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/gpo/syspol.txt 
curl -o C:\Windows\deploy\firefoxpol.txt https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/gpo/firefoxpol.txt
curl -o C:\Windows\deploy\edgepol.txt https://raw.githubusercontent.com/oszuidwest/windows10-baseline/master/gpo/edgepol.txt 

TIMEOUT 5

START C:\Windows\deploy\LGPO.exe /r C:\Windows\deploy\userpol.txt /w C:\Windows\deploy\userpol.pol
START C:\Windows\deploy\LGPO.exe /r C:\Windows\deploy\syspol.txt /w C:\Windows\deploy\syspol.pol
START C:\Windows\deploy\LGPO.exe /r C:\Windows\deploy\firefoxpol.txt /w C:\Windows\deploy\firefoxpol.pol
START C:\Windows\deploy\LGPO.exe /r C:\Windows\deploy\edgepol.txt /w C:\Windows\deploy\edgepol.pol

TIMEOUT 5

START C:\Windows\deploy\LGPO.exe /un C:\Windows\deploy\userpol.pol
START C:\Windows\deploy\LGPO.exe /m C:\Windows\deploy\syspol.pol
START C:\Windows\deploy\LGPO.exe /m C:\Windows\deploy\firefoxpol.pol
START C:\Windows\deploy\LGPO.exe /m C:\Windows\deploy\edgepol.pol