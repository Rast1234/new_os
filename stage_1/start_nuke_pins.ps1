# NOTES:
#   verb "unpin from start menu" DOES NOT WORK: DoIt() throws access exception
#   relies on ENGLISH locale

# unpin UWP (Edge, Mail)
Import-Module StartLayout
$apps = Get-StartApps 
$shell = New-Object -ComObject Shell.Application
$folder = $shell.Namespace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}')
$startItems = foreach ($x in $folder.items()){ $x }
foreach ($app in $apps) {
    $appId = $app.AppId
    $comApp = $startItems | where { $_.Path -eq $appId }
    if($comApp -eq $null){
        echo "$appId not found"
        continue
    }
    $verbs = foreach ($x in $comApp.verbs()){ $x }
    $verb = $verbs | Where-Object {$_.Name.replace('&', '').ToLower().Contains('unpin from taskbar')}
    if($verb -ne $null){
        echo "unpin from taskbar: $appId"
        $verb.DoIt()
    }   
}

# unpin the rest (eg Explorer)
# NOTE: pttb tool can't pin special explorer .lnk so we better leave it alone and rearrange manually later
#Remove-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Recurse -Force