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