if "%_deploy_computer_purpose%"=="redactie" net user "Redactie Gebruiker" %_deploy_user_password% /ADD
if "%_deploy_computer_purpose%"=="edit" net user "Edit Gebruiker" %_deploy_user_password% /ADD
if "%_deploy_computer_purpose%"=="fm" net user "Studio Gebruiker" %_deploy_user_password% /ADD

if "%_deploy_computer_purpose%"=="redactie" REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "Redactie Gebruiker" /f
if "%_deploy_computer_purpose%"=="edit" REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "Edit Gebruiker" /f
if "%_deploy_computer_purpose%"=="fm" REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "Studio Gebruiker" /f

if not "%_deploy_computer_purpose%"=="plain" if not "%_deploy_computer_purpose%"=="laptop" (
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d "%_deploy_user_password%" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
)

net accounts /maxpwage:unlimited
