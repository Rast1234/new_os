# enable numlock on boot
$jobname = "NUMLOCK ON FFS"
$action = New-ScheduledTaskAction -Execute "c:\bin\numlock.vbs"
$trigger = New-ScheduledTaskTrigger -AtStartup
$msg = "Enter the username and password that will run the task"; 
$principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
Register-ScheduledTask -TaskName $jobname -Action $action -Trigger $trigger -Principal $principal