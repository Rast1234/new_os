if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw "Run as admin!"
}

echo "=== Stage 1 ==="

echo "=== Disabling UAC ==="
reg import uac_disable.reg

echo "=== Disabling Windows Update auto-reboot ==="
reg import update_reboot_disable.reg

echo "=== Configuring screensaver ==="
reg import screensaver.reg

echo "=== Configuring time ==="
Set-TimeZone -Name 'Georgian Standard Time'
reg import clock.reg

echo "=== Configuring theme ==="
reg import theme.reg

echo "=== Configuring explorer and stuff ==="
reg import explorer_settings.reg

echo "=== Creating C:\vault ==="
mkdir c:\vault

echo "=== Populating C:\bin ==="
./add_bin_and_copy.ps1

echo "=== Creating scheduled tasks ==="
./add_startup_tasks.ps1

echo "=== Configuring power profiles ==="
./power.ps1

echo "=== Configuring languages ==="
./lang_1.ps1

echo "=== Configuring taskbar ==="
reg import start_taskbar_settings.reg

echo "=== Disabling adware ==="
reg import adware_disable.reg
Set-WindowsSearchSetting -EnableWebResultsSetting $false

echo "=== Disabling services ==="
./services_disable.ps1

echo "=== Preventing Playstation gamepad wired sound device installation ==="
reg import prevent_devices.reg

echo "=== Disabling telemetry tasks ==="
./tasks_disable.ps1

echo "=== Explorer QuickAccess pins ==="
./pin_defaults.ps1

echo "=== Nuking APPX adware ==="
./appx_nuke.ps1

echo "=== Nuking OneDrive ==="
./onedrive_nuke.ps1

echo "=== Nuking Start pins ==="
./start_nuke_pins.ps1

echo "=== Nuking Start tiles ==="
./start_nuke_tiles.ps1

echo "=== Done! ==="