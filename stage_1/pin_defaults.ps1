$comApp = New-Object -ComObject shell.application
$recents = @(
    "$env:USERPROFILE\Videos",
    "$env:USERPROFILE\Music"
)
$obj = $comApp.Namespace('shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}').Items() | ? {$_.Path -in $recents}
$obj.InvokeVerb('removefromhome')

$unpin = @(
    "$env:USERPROFILE\Desktop",
    "$env:USERPROFILE\Downloads",
    "$env:USERPROFILE\Documents",
    "$env:USERPROFILE\Pictures"
)
ForEach ($dir in $unpin) { $comApp.Namespace($dir).Self.InvokeVerb('pintohome') }
$obj = $comApp.Namespace('shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}').Items() | ? {$_.Path -in $unpin}
$obj.InvokeVerb('unpinfromhome')

$pin = @(
    "C:\vault",
    "$env:USERPROFILE",
    "$env:USERPROFILE\Downloads"
)
ForEach ($dir in $pin) { $comApp.Namespace($dir).Self.InvokeVerb('pintohome') }