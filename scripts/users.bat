if "%_deploy_computer_purpose%"=="redactie" net user "Redactie Gebruiker" oszw /ADD
if "%_deploy_computer_purpose%"=="edit" net user "Edit Gebruiker" oszw /ADD
if "%_deploy_computer_purpose%"=="fm" net user "Studio Gebruiker" oszw /ADD

if "%_deploy_computer_purpose%"=="redactie" REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "Redactie Gebruiker" /f
if "%_deploy_computer_purpose%"=="edit" REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "Edit Gebruiker" /f
if "%_deploy_computer_purpose%"=="fm" REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "Studio Gebruiker" /f

if not "%_deploy_computer_purpose%"=="plain" if not "%_deploy_computer_purpose%"=="laptop" (
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d "oszw" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
)

net accounts /maxpwage:unlimited
