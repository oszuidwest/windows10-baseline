@echo off
if "%_deploy_computer_purpose%"=="fm" curl -o C:\Windows\deploy\start.xml https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/assets/start-fm.xml
if "%_deploy_computer_purpose%"=="edit" curl -o C:\Windows\deploy\start.xml https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/assets/start-edit.xml
if "%_deploy_computer_purpose%"=="redactie" curl -o C:\Windows\deploy\start.xml https://raw.githubusercontent.com/oszuidwest/windows10-baseline/main/assets/start-redactie.xml
