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
* gog: copy plugins to appdata, login to all profiles manually
* move taskbar left, also in all desktop modes
* discord: login, disable game status monitoring, add hotkey: mute on break
* steam: login, check if config applied, change library path, disable notifications, disable toasts
* sharex: configure shell extension
* 7zip: shell extension
* aimp: shell extension
* xnview: shell extension
* ds4windows: run through wizard, install drivers, setup hidhide
* peace/equalizerapo: set up devices

## TODO automate stuff

* file associations didnt work?
* drop-down quake terminal?
	* ???
* rider settings
* display modes control?
* review and refactor scripts
* RTSS settings, overlays, hotkeys
* prom-hwinfo-grafana stack
* promdapter install
* nuke meet / meetnow
* LLT/HWinfo/RTSS startup order or delay?
* lock screen 
  * caps lang switch
  * set eng as default lang