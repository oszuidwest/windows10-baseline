# windows10-baseline
Baseline configuration for Windows 10 computers owned by Streekomroep ZuidWest. Based on nl_NL Windows 10 Pro 21H2. Not tested on other versions.

## How to use

- Start `cmd.exe`
- cd to some directory
- run `curl -o start.bat https://is.gd/w10baseline -L`
- run `start.bat` as adminitrator

## Purposes

All computers get: sudo, time and power, workgroup, package manager, security baseline, baseline apps, clean w10. Extras per purpose:

- **fm**: fm wallpaper, fm users, audio edit apps and libreoffice
- **edit**: tv wallpaper, edit users and libreoffice
- **redactie**: update wallpaper, redactie users, audio edit apps, paint.net and libreoffice
- **laptop**: no wallpaper, no users, audio edit apps, paint.net and libreoffice (use for personal laptops for employees)
- **plain**: no wallpaper, no users, no apps (used for playout or other single purpose computers)
