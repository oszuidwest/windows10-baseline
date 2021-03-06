@echo off
if not "%_deploy_computer_purpose%"=="plain" (
    choco install vlc -y
    choco install 7zip -y
    choco install libreoffice-fresh -y
    choco install microsoft-teams.install -y --params "'/AllUsers /NoAutoStart'"
)

if "%_deploy_computer_purpose%"=="fm" (
    choco install audacity -y
    choco install thunderbird -y
)

if "%_deploy_computer_purpose%"=="laptop" (
    choco install audacity -y
    choco install thunderbird -y
)

if "%_deploy_computer_purpose%"=="redactie" (
    choco install audacity -y
)

if "%_deploy_computer_purpose%"=="laptop" if "%_deploy_computer_purpose%"=="redactie" (
    choco install paint.net -y
)
