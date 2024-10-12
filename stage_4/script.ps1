if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw "Run as admin!"
}

echo "=== Stage 4 ==="

echo "=== Windows Update ==="
echo "WILL AUTO REBOOT!"
echo "repeat this step until no updates found"

Import-Module PSWindowsUpdate
Get-WindowsUpdate -AcceptAll -Install -AutoReboot

echo "=== Done! ==="