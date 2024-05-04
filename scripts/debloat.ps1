# Define a function to remove UWP apps system-wide
function Remove-ProvisionedApp {
    param (
        [string[]]$AppxPackages
    )

    foreach ($app in $AppxPackages) {
        $package = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like $app }
        if ($package) {
            Write-Output "Removing system-wide provisioned app: $app..."
            Remove-AppxProvisionedPackage -Online -PackageName $package.PackageName -ErrorAction SilentlyContinue
            Write-Output "$app removed successfully from the system image."
        }
        else {
            Write-Output "$app not found in provisioned packages or already removed."
        }
    }
}

# List of apps to be removed system-wide
$ProvisionedMSApps = @(
        # Default Windows 10+ apps
        "Microsoft.3DBuilder"                    # 3D Builder
        "Microsoft.549981C3F5F10"                # Cortana
        "Microsoft.Appconnector"
        "Microsoft.BingFinance"                  # Finance
        "Microsoft.BingFoodAndDrink"             # Food And Drink
        "Microsoft.BingHealthAndFitness"         # Health And Fitness
        "Microsoft.BingNews"                     # News
        "Microsoft.BingSports"                   # Sports
        "Microsoft.BingTranslator"               # Translator
        "Microsoft.BingTravel"                   # Travel
        "Microsoft.BingWeather"                  # Weather
        "Microsoft.CommsPhone"
        "Microsoft.ConnectivityStore"
        "Microsoft.GetHelp"
        "Microsoft.Getstarted"
        "Microsoft.Messaging"
        "Microsoft.Microsoft3DViewer"
        "Microsoft.MicrosoftOfficeHub"
        "Microsoft.MicrosoftPowerBIForWindows"
        "Microsoft.MicrosoftSolitaireCollection" # MS Solitaire
        "Microsoft.MixedReality.Portal"
        "Microsoft.NetworkSpeedTest"
        "Microsoft.Office.OneNote"               # MS Office One Note
        "Microsoft.Office.Sway"
        "Microsoft.OneConnect"
        "Microsoft.People"                       # People
        "Microsoft.MSPaint"                      # Paint 3D
        "Microsoft.Print3D"                      # Print 3D
        "Microsoft.SkypeApp"                     # Skype (Who still uses Skype? Use Discord)
        "Microsoft.Todos"                        # Microsoft To Do
        "Microsoft.Wallet"
        "Microsoft.Whiteboard"                   # Microsoft Whiteboard
        "Microsoft.WindowsAlarms"                # Alarms
        "microsoft.windowscommunicationsapps"
        "Microsoft.WindowsFeedbackHub"           # Feedback Hub
        "Microsoft.WindowsMaps"                  # Maps
        "Microsoft.WindowsPhone"
        "Microsoft.WindowsReadingList"
        "Microsoft.WindowsSoundRecorder"         # Windows Sound Recorder
        "Microsoft.XboxApp"                      # Xbox Console Companion (Replaced by new App)
        "Microsoft.YourPhone"                    # Your Phone
        "Microsoft.ZuneMusic"                    # Groove Music / (New) Windows Media Player
        "Microsoft.ZuneVideo"                    # Movies & TV
        "Microsoft.Windows.DevHome"              # DevHome
        # Apps which other apps depend on
        "Microsoft.Advertising.Xaml"

        # Default Windows 11 apps
        "Clipchamp.Clipchamp"				     # Clipchamp – Video Editor
        "MicrosoftWindows.Client.WebExperience"  # Taskbar Widgets
        "MicrosoftTeams"                         # Microsoft Teams / Previewo"
)

$ProvisionedThirdPartyApps = @(
    "*ACGMediaPlayer*"
    "*ActiproSoftwareLLC*"
    "*AdobePhotoshopExpress*"           # Adobe Photoshop Express
    "Amazon.com.Amazon"                 # Amazon Shop
    "*Asphalt8Airborne*"                # Asphalt 8 Airbone
    "*AutodeskSketchBook*"
    "*BubbleWitch3Saga*"                # Bubble Witch 3 Saga
    "*CaesarsSlotsFreeCasino*"
    "*CandyCrush*"                      # Candy Crush
    "*COOKINGFEVER*"
    "*CyberLinkMediaSuiteEssentials*"
    "*DisneyMagicKingdoms*"
    "*Dolby*"                           # Dolby Products (Like Atmos)
    "*DrawboardPDF*"
    "*Duolingo-LearnLanguagesforFree*"  # Duolingo
    "*EclipseManager*"
    "*FarmVille2CountryEscape*"
    "*FitbitCoach*"
    "*Flipboard*"                       # Flipboard
    "*HiddenCity*"
    "*Keeper*"
    "*LinkedInforWindows*"
    "*MarchofEmpires*"
    "*NYTCrossword*"
    "*OneCalendar*"
    "*PandoraMediaInc*"
    "*PhototasticCollage*"
    "*PicsArt-PhotoStudio*"
    "*PolarrPhotoEditorAcademicEdition*"
    "*RoyalRevolt*"                     # Royal Revolt
    "*Shazam*"
    "*Sidia.LiveWallpaper*"             # Live Wallpaper
    "*Speed Test*"
    "*Sway*"
    "*WinZipUniversal*"
    "*Wunderlist*"
    "*XING*"
)

# Define the function to start removal process
function Remove-BloatwareSystemWide {
    Write-Output "Starting the removal of system-wide Microsoft provisioned apps..."
    Remove-ProvisionedApp -AppxPackages $ProvisionedMSApps

    Write-Output "Starting the removal of system-wide third-party provisioned apps..."
    Remove-ProvisionedApp -AppxPackages $ProvisionedThirdPartyApps# Define a function to remove UWP apps system-wide
function Remove-ProvisionedApp {
    param (
        [string[]]$AppxPackages
    )

    foreach ($app in $AppxPackages) {
        $package = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like $app }
        if ($package) {
            Write-Output "Removing system-wide provisioned app: $app..."
            Remove-AppxProvisionedPackage -Online -PackageName $package.PackageName -ErrorAction SilentlyContinue
            Write-Output "$app removed successfully from the system image."
        }
        else {
            Write-Output "$app not found in provisioned packages or already removed."
        }
    }
}

# List of apps to be removed system-wide
$ProvisionedMSApps = @(
    # Default Windows 10+ apps
    "Microsoft.3DBuilder",                    # 3D Builder
    "Microsoft.549981C3F5F10",                # Cortana
    "Microsoft.Appconnector",
    "Microsoft.BingFinance",                  # Finance
    "Microsoft.BingFoodAndDrink",             # Food And Drink
    "Microsoft.BingHealthAndFitness",         # Health And Fitness
    "Microsoft.BingNews",                     # News
    "Microsoft.BingSports",                   # Sports
    "Microsoft.BingTranslator",               # Translator
    "Microsoft.BingTravel",                   # Travel
    "Microsoft.BingWeather",                  # Weather
    "Microsoft.CommsPhone",
    "Microsoft.ConnectivityStore",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.Messaging",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftPowerBIForWindows",
    "Microsoft.MicrosoftSolitaireCollection", # MS Solitaire
    "Microsoft.MixedReality.Portal",
    "Microsoft.NetworkSpeedTest",
    "Microsoft.Office.OneNote",               # MS Office One Note
    "Microsoft.Office.Sway",
    "Microsoft.OneConnect",
    "Microsoft.People",                       # People
    "Microsoft.MSPaint",                      # Paint 3D
    "Microsoft.Print3D",                      # Print 3D
    "Microsoft.SkypeApp",                     # Skype (Who still uses Skype? Use Discord)
    "Microsoft.Todos",                        # Microsoft To Do
    "Microsoft.Wallet",
    "Microsoft.Whiteboard",                   # Microsoft Whiteboard
    "Microsoft.WindowsAlarms",                # Alarms
    "microsoft.windowscommunicationsapps",
    "Microsoft.WindowsFeedbackHub",           # Feedback Hub
    "Microsoft.WindowsMaps",                  # Maps
    "Microsoft.WindowsPhone",
    "Microsoft.WindowsReadingList",
    "Microsoft.WindowsSoundRecorder",         # Windows Sound Recorder
    "Microsoft.XboxApp",                      # Xbox Console Companion (Replaced by new App)
    "Microsoft.YourPhone",                    # Your Phone
    "Microsoft.ZuneMusic",                    # Groove Music / (New) Windows Media Player
    "Microsoft.ZuneVideo",                    # Movies & TV
    "Microsoft.Windows.DevHome",              # DevHome
    # Apps which other apps depend on
    "Microsoft.Advertising.Xaml",

    # Default Windows 11 apps
    "Clipchamp.Clipchamp",                    # Clipchamp – Video Editor
    "MicrosoftWindows.Client.WebExperience",  # Taskbar Widgets
    "MicrosoftTeams"                          # Microsoft Teams / Preview
)

$ProvisionedThirdPartyApps = @(
    "*ACGMediaPlayer*",
    "*ActiproSoftwareLLC*",
    "*AdobePhotoshopExpress*",           # Adobe Photoshop Express
    "Amazon.com.Amazon",                 # Amazon Shop
    "*Asphalt8Airborne*",                # Asphalt 8 Airbone
    "*AutodeskSketchBook*",
    "*BubbleWitch3Saga*",                # Bubble Witch 3 Saga
    "*CaesarsSlotsFreeCasino*",
    "*CandyCrush*",                      # Candy Crush
    "*COOKINGFEVER*",
    "*CyberLinkMediaSuiteEssentials*",
    "*DisneyMagicKingdoms*",
    "*Dolby*",                           # Dolby Products (Like Atmos)
    "*DrawboardPDF*",
    "*Duolingo-LearnLanguagesforFree*",  # Duolingo
    "*EclipseManager*",
    "*FarmVille2CountryEscape*",
    "*FitbitCoach*",
    "*Flipboard*",                       # Flipboard
    "*HiddenCity*",
    "*Keeper*",
    "*LinkedInforWindows*",
    "*MarchofEmpires*",
    "*NYTCrossword*",
    "*OneCalendar*",
    "*PandoraMediaInc*",
    "*PhototasticCollage*",
    "*PicsArt-PhotoStudio*",
    "*PolarrPhotoEditorAcademicEdition*",
    "*RoyalRevolt*",                     # Royal Revolt
    "*Shazam*",
    "*Sidia.LiveWallpaper*",             # Live Wallpaper
    "*Speed Test*",
    "*Sway*",
    "*WinZipUniversal*",
    "*Wunderlist*",
    "*XING*"
)

# Define the function to start removal process
function Remove-BloatwareSystemWide {
    Write-Output "Starting the removal of system-wide Microsoft provisioned apps..."
    Remove-ProvisionedApp -AppxPackages $ProvisionedMSApps

    Write-Output "Starting the removal of system-wide third-party provisioned apps..."
    Remove-ProvisionedApp -AppxPackages $ProvisionedThirdPartyApps
}

# Execute the removal function
Remove-BloatwareSystemWide

}

# Execute the removal function
Remove-BloatwareSystemWide
