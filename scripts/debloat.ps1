<#
   Windows 10 debloat
   Tested only on Windows 10 2021H2
#>

# Microsoft bloatware
$apps = @(
    "Microsoft.3DBuilder"
    "Microsoft.Appconnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingTranslator"
    "Microsoft.BingWeather"
    "Microsoft.FreshPaint"
    "Microsoft.GamingServices"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.MinecraftUWP"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.OneNote"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.Wallet"
    "Microsoft.Windows.Photos"
    "Microsoft.WindowsAlarms"
    "Microsoft.WindowsCalculator"
    "Microsoft.WindowsCamera"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.YourPhone"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.BingTravel"
    "Microsoft.WindowsReadingList"
    "Microsoft.MixedReality.Portal"
    "Microsoft.ScreenSketch"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.Todos"
    "Microsoft.MicrosoftMahjong"
    "Microsoft.549981C3F5F10" # Dit is cortana
    "*king.com.BubbleWitch3Saga*"
    "*king.com.CandyCrushSodaSaga*"
    "*king.com.CandyCrushSaga*"
    "*Microsoft.Asphalt8Airborne*"
)

foreach ($app in $apps) {
    Get-AppxPackage -Name $app | Remove-AppxPackage -AllUsers

    Get-AppXProvisionedPackage -Online |
        Where-Object DisplayName -EQ $app |
        Remove-AppxProvisionedPackage -Online
}

# Online components (Windows Store etc)
Get-AppXProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online -AllUsers

# We don't need IE11
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "Internet-Explorer-Optional-amd64"

# SMBv1 is unsafe
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "SMB1Protocol"

# XPS printer is not needed
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "Printing-XPSServices-Features"

# Remove PC Health Check App
$PcHealthCheckBloatware = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Windows Pc-statuscontrole"}
$PcHealthCheckBloatware.Uninstall()

# Prevent PC Health Check App from being installed
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\PCHC") -ne $true) {  New-Item "HKLM:\SOFTWARE\Microsoft\PCHC" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\PCHC' -Name 'PreviousUninstall' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;

# This command shows all the installed apps, here for debugging
#Get-AppxPackage -AllUsers | Select Name, PackageFullName
