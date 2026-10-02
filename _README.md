# Init scripts

Prepare new installation of Windows 10 for work

## Half-automated things

> Process is split into stages. REBOOT AFTER EACH STAGE!

Open stage folder and either run `_run_me.cmd` or manually click through all installers there, look for errors, **reboot**

Device- and machine-specific drivers should be installed on a corresponding machine, obviously.

## Manual things

* create app backup, apply app backup (stage 5)
* click through all installers
* chrome login
* ms store login
* move taskbar left, also in all desktop modes
* discord: check if settings backup works. login, disable game status monitoring, hotkey "mute on break"
* steam: login, check if config applied, change library path, check millenium
* sharex: configure shell extension
* 7zip: shell extension
* aimp: shell extension
* xnview: shell extension
* ds4windows
  * run through wizard
  * install drivers
  * setup hidhide: apps tab = no changes, devices tab = tick (hide) all HID-compliant game controller
* peace/equalizerapo: set up devices
* prom-hwinfo-grafana-promdapter stack: check that everything is up

## TODO automate stuff

* file associations didnt work?
* drop-down quake terminal?
	* ???
* rider settings
* display modes control?
* LLT/HWinfo/RTSS startup order or delay?
* openal eax hrtf
* paint.net plugin pack
* wifi export-import
* useful start shortcuts
* userprofile script to bin, make auto-admin runnable, maybe just compile exe?


### TODO add gpedit

ADD GPEDIT TO WIN HOME:

Get-ChildItem @(
    "C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package*.mum",
    "C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package*.mum"
) | ForEach-Object { dism.exe /online /norestart /add-package:"$_" }

### TODO wifi

$challenge = Read-Host "Export(1) or Import(2)?"
if ($challenge -eq "1") {
  New-Item -Path '.\wifi' -ItemType Directory

  $ProfileList = Invoke-Expression -Command 'netsh wlan show profile'
  $ProfileList | ForEach-Object -Process {
    $matches = $null
    $null = $PSItem -match ': (?<ProfileName>.*)$'
    if ($matches) {
      netsh wlan export profile $matches.ProfileName key=clear folder='.\wifi'
    }
  }
} elseif ($challenge -eq "1") {
  $XmlDirectory = '.\wifi'
  Get-ChildItem $XmlDirectory | Where-Object {$_.extension -eq '.xml'} | ForEach-Object {
    netsh wlan add profile filename=($XmlDirectory + '\' + $_.name)
  }
}

### 