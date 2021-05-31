@echo off
if not "_deploy_computer_purpose%=="plain" (
    choco install firefoxesr -y
    choco install vlc -y
    choco install teamviewer.host -y --ignore-checksums
) else (
    echo plain configuration selected, not installing apps )
