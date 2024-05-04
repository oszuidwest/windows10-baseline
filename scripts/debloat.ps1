# Define function to remove provisioned apps
function Remove-ProvisionedApp {
    param (
        [string[]]$AppxPackages
    )

    foreach ($app in $AppxPackages) {
        $packageInfo = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like $app }
        if ($packageInfo) {
            Remove-AppxProvisionedPackage -Online -PackageName $packageInfo.PackageName -ErrorAction SilentlyContinue
            Write-Output "Provisioned app removed: $app"
        } else {
            Write-Output "No provisioned app found to remove: $app"
        }
    }
}

# Define function to remove apps for all users
function Remove-AppxPackageForAllUsers {
    param (
        [string[]]$AppxPackages
    )

    foreach ($app in $AppxPackages) {
        Get-AppxPackage -AllUsers -Name $app | ForEach-Object {
            Remove-AppxPackage -Package $_.PackageFullName -AllUsers -ErrorAction SilentlyContinue
            Write-Output "Removed app for all users: $app"
        }
    }
}

# List of Microsoft apps to be removed
$MSApps = @(
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

# List of third-party apps to be removed
$ThirdPartyApps = @(
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

# List of Xbox apps to be removed
$XboxApps = @(
    "Microsoft.GamingApp",               # Xbox
    "Microsoft.GamingServices",          # Gaming Services
    "Microsoft.XboxApp",                 # Xbox Console Companion (Legacy App)
    "Microsoft.XboxGameCallableUI",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.XboxGamingOverlay",       # Xbox Game Bar
    "Microsoft.XboxIdentityProvider",    # Xbox Identity Provider (Xbox Dependency)
    "Microsoft.Xbox.TCUI"               # Xbox Live API communication (Xbox Dependency)
)

# Execute the removal functions
Remove-ProvisionedApp -AppxPackages $MSApps + $ThirdPartyApps + $XboxApps
Remove-AppxPackageForAllUsers -AppxPackages $MSApps + $ThirdPartyApps + $XboxApps
