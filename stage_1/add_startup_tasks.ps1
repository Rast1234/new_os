# custom tasks for scheduler because not all apps are smart enough to start themselves properly
# code blocks for keeping local variables from messing up multiple tasks

# common params
$author = "imported from scripts"

# does not work reliably
$atStartup = New-ScheduledTaskTrigger -AtStartup

$atLogon = New-ScheduledTaskTrigger -AtLogon
$atLogon1M = New-ScheduledTaskTrigger -AtLogon
$atLogon1M.Delay = "PT1M"
$atLogon10S = New-ScheduledTaskTrigger -AtLogon
$atLogon10S.Delay = "PT10S"

$asAdmin = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest

{
    # enable numlock on boot because windows can't keep its own settings
    $action = New-ScheduledTaskAction -Execute "c:\bin\numlock.vbs"
    $task = New-ScheduledTask -Action $action -Trigger $atLogon -Principal $asAdmin
    $task.Author = $author
    Register-ScheduledTask -TaskName "NUMLOCK ON FFS" -InputObject $task
}.Invoke()

{
    # manual RTSS task because it throws errors sometimes if started without delay
    $action = New-ScheduledTaskAction -Execute "C:\Program Files (x86)\RivaTuner Statistics Server\RTSS.exe"
    $task = New-ScheduledTask -Action $action -Trigger $atLogon1M -Principal $asAdmin
    $task.Author = $author
    Register-ScheduledTask -TaskName "RTSS DELAYED" -InputObject $task
}.Invoke()
