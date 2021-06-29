@echo off
if not "%_deploy_computer_purpose%"=="plain" (
    choco install firefoxesr -y
    choco install vlc -y
    choco install 7zip -y
    choco install libreoffice-fresh -y
    choco install teamviewer.host -y --ignore-checksums
)
if "%_deploy_computer_purpose%"=="fm" if "%_deploy_computer_purpose%"=="laptop" "%_deploy_computer_purpose%"=="redactie" (
    choco install audacity -y
    choco install paint.net -y
)
