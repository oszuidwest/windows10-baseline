@echo off
set "base_url=https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/assets"
set "wallpaper_path=C:\Windows\deploy\wallpaper.png"

if "%_deploy_computer_purpose%"=="fm" (
    curl -o "%wallpaper_path%" "%base_url%/ZWFM-wallpaper.png"
)
if "%_deploy_computer_purpose%"=="edit" (
    curl -o "%wallpaper_path%" "%base_url%/ZWTV-wallpaper.png"
)
if "%_deploy_computer_purpose%"=="redactie" (
    curl -o "%wallpaper_path%" "%base_url%/ZWUP-wallpaper.png"
)
