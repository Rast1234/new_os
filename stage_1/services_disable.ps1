# services
$services = @(
    "diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                # Diagnostics Tracking Service
    "dmwappushservice"                         # WAP Push Message Routing Service (see known issues)
    "lfsvc"                                    # Geolocation Service
    "MapsBroker"                               # Downloaded Maps Manager
    "NetTcpPortSharing"                        # Net.Tcp Port Sharing Service
    "RemoteAccess"                             # Routing and Remote Access
    "RemoteRegistry"                           # Remote Registry
    "SharedAccess"                             # Internet Connection Sharing (ICS)
    "TrkWks"                                   # Distributed Link Tracking Client
    "WbioSrvc"                                 # Windows Biometric Service (required for Fingerprint reader / facial detection)
    "WMPNetworkSvc"                            # Windows Media Player Network Sharing Service
    "XblAuthManager"                           # Xbox Live Auth Manager
    "XblGameSave"                              # Xbox Live Game Save Service
    "XboxNetApiSvc"                            # Xbox Live Networking Service
    "ndu"                                      # Windows Network Data Usage Monitor
    "edgeupdate"
    "edgeupdatem"
    "MicrosoftEdgeElevationService"
    "PcaSvc"
    "TroubleshootingSvc"
    "winrm"
    "BDESVC"
    "DPS"
    "fhsvc"
    "Netlogon"
    "WpcMonSvc"
    "WerSvc"
    "wisvc"
    "BTAGService"  # bluetooth handsfree profile (bad audio mode support for all bt headphones)

    # Services which cannot be disabled:
    #"WdNisSvc"
)

foreach ($service in $services) {
    echo "Disabling service: $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}

# disable Prefetch

echo "Disable services: prefetch"
Disable-MMAgent -ApplicationPreLaunch
# NOTE: throws not supported error
#echo "Disable services: another prefetch"
#Disable-MMAgent -ApplicationLaunchPrefetching

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetch /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetcher /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v AllowPrelaunch /t REG_DWORD /d "0" /f
