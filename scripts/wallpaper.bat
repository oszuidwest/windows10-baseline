@echo off
if "%_deploy_computer_purpose%"=="fm" curl -o C:\Windows\deploy\wallpaper.png https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/assets/ZWFM-wallpaper.png
if "%_deploy_computer_purpose%"=="edit" curl -o C:\Windows\deploy\wallpaper.png https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/assets/ZWTV-wallpaper.png
if "%_deploy_computer_purpose%"=="redactie" curl -o C:\Windows\deploy\wallpaper.png https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/assets/ZWUP-wallpaper.png
