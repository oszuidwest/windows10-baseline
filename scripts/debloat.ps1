# Define a function to remove UWP apps based on their package names
function Remove-UWPApp {
    param (
        [string[]]$AppxPackages
    )

    foreach ($app in $AppxPackages) {
        $package = Get-AppxPackage -Name $app -ErrorAction SilentlyContinue
        if ($package) {
            Write-Output "Removing $app..."
            Remove-AppxPackage -Package $package.PackageFullName -ErrorAction SilentlyContinue
            Write-Output "$app removed successfully."
        }
        else {
            Write-Output "$app not found or already removed."
        }
    }
}

# Define the list of Microsoft, third-party, manufacturer, social media, and streaming service apps to remove
$MSApps = @(
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

$ThirdPartyApps = @(
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

$ManufacturerApps = @(
    "DB6EA5DB.MediaSuiteEssentialsforDell",
    "DB6EA5DB.PowerMediaPlayerforDell",
    # More apps...
    "4AE8B7C2.BOOKING.COMPARTNERAPPSAMSUNGEDITION"
)

$SocialMediaApps = @(
        "5319275A.WhatsAppDesktop"  # WhatsApp
        "BytedancePte.Ltd.TikTok"   # TikTok
        "FACEBOOK.317180B0BB486"    # Messenger
        "FACEBOOK.FACEBOOK"         # Facebook
        "Facebook.Instagram*"       # Instagram / Beta
        "*Twitter*"                 # Twitter
        "*Viber*"
)

$StreamingServicesApps = @(
        "AmazonVideo.PrimeVideo"    # Amazon Prime Video
        "*Hulu*"
        "*iHeartRadio*"
        "*Netflix*"                 # Netflix
        "*Plex*"                    # Plex
        "*SlingTV*"
        "SpotifyAB.SpotifyMusic"    # Spotify
        "*TuneInRadio*"
)

$XboxApps = @(
    "Microsoft.GamingApp"               # Xbox
    "Microsoft.GamingServices"          # Gaming Services
    "Microsoft.XboxApp"                 # Xbox Console Companion (Legacy App)
    "Microsoft.XboxGameCallableUI"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.XboxGamingOverlay"       # Xbox Game Bar
    "Microsoft.XboxIdentityProvider"    # Xbox Identity Provider (Xbox Dependency)
    "Microsoft.Xbox.TCUI"               # Xbox Live API communication (Xbox Dependency)
)

# Removing Apps
function Remove-BloatwareAppsList {
    Write-Output "Starting the removal of Microsoft Apps..."
    Remove-UWPApp -AppxPackages $MSApps

    Write-Output "Starting the removal of 3rd-party Apps..."
    Remove-UWPApp -AppxPackages $ThirdPartyApps

    Write-Output "Starting the removal of Social Media Apps..."
    Remove-UWPApp -AppxPackages $SocialMediaApps

    Write-Output "Starting the removal of Streaming Services Apps..."
    Remove-UWPApp -AppxPackages $StreamingServicesApps

    Write-Output "Starting the removal of Xbox Apps..."
    Remove-UWPApp -AppxPackages $XboxApps
}

# Execute the function to remove the bloatware
Remove-BloatwareAppsList
