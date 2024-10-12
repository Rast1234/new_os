$enable=@(
    "LegacyComponents"
    "DirectPlay"
    "NetFx3"
)
foreach ($x in $enable) {
    echo "Windows Features: enabling $x"
    Enable-WindowsOptionalFeature -Online -FeatureName $x -NoRestart
}

$disable=@(
    "WindowsMediaPlayer"
    "SMB1Protocol"
    "SMB1Protocol-Client"
    "SMB1Protocol-Deprecation"
    "Internet-Explorer-Optional-amd64"
    "MediaPlayback"
    "Microsoft-SnippingTool"
    "Printing-XPSServices-Features"
    "WCF-TCP-PortSharing45"
    "WorkFolders-Client"
    "WCF-Services45"
    "Printing-Foundation-InternetPrinting-Client"
)
foreach ($x in $disable) {
    echo "Windows Features: disabling $x"
    Disable-WindowsOptionalFeature -Online -FeatureName $x -NoRestart
}
