@echo off
if not "%_deploy_computer_purpose%"=="plain" (
    choco install firefoxesr -y
    choco install vlc -y
    choco install 7zip -y
    choco install teamviewer.host -y --ignore-checksums
)
