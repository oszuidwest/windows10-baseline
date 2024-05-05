<#
   Windows 10 debloat
   Tested only on Windows 10 Pro 2022H2
#>

# Microsoft bloatware
$apps = @(
    "Microsoft.549981C3F5F10", # This is Cortana!
    "Microsoft.BingWeather",
    "Microsoft.FeedbackHub",
    "Microsoft.GetHelp",
    "Microsoft.GetStarted",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftEdge", # This is the old Edge browser
    "Microsoft.MicrosoftEdgeDevToolsClient",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MixedReality.Portal",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.MSPaint",
    "Microsoft.Office.OneNote",
    "Microsoft.People",
    "Microsoft.ScreenSketch",
    "Microsoft.SkypeApp",
    "Microsoft.Wallet",
    "Microsoft.Windows.Photos",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameCallableUI",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.YourPhone",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.windowscommunicationsapps"
)

# Loop through each app and remove it from all users and system provisioning
foreach ($app in $apps) {
    Write-Output "Attempting to remove $app from all users..."
    $packages = Get-AppxPackage -Name $app -AllUsers
    if ($packages) {
        $packages | Remove-AppxPackage -AllUsers
        if (!$?) {
            Write-Output "Failed to remove $app from all users."
        } else {
            Write-Output "$app removed from all users successfully."
        }
    } else {
        Write-Output "No packages found for $app on any user."
    }

    Write-Output "Attempting to remove provisioning for $app..."
    $provisionedPackages = Get-AppXProvisionedPackage -Online | Where-Object DisplayName -eq $app
    if ($provisionedPackages) {
        $provisionedPackages | Remove-AppxProvisionedPackage -Online
        if (!$?) {
            Write-Output "Failed to remove provisioned package for $app."
        } else {
            Write-Output "Provisioning for $app removed successfully."
        }
    } else {
        Write-Output "No provisioned package found for $app."
    }
}

# We don't need IE11
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "Internet-Explorer-Optional-amd64"

# SMBv1 is unsafe
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "SMB1Protocol"
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "SMB1Protocol-Client"
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "SMB1Protocol-Server"

# XPS printer is not needed
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "Printing-XPSServices-Features"

# Remove PC Health Check App
$PcHealthCheckBloatware = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Windows Pc-statuscontrole"}
$PcHealthCheckBloatware.Uninstall()

# Prevent PC Health Check App from being installed
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\PCHC") -ne $true) {  New-Item "HKLM:\SOFTWARE\Microsoft\PCHC" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\PCHC' -Name 'PreviousUninstall' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;

# Get rid of OneDrive
Start-Process c:\windows\deploy\onedrive.bat

# This command shows all the installed apps, here for debugging
#Get-AppxPackage -AllUsers | Select Name, PackageFullName
