if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw "Run as admin!"
}

echo "=== Stage 2 ==="

echo "=== Configuring languages ==="
./lang_2.ps1

echo "=== Configuring locale ==="
reg import locale.reg


echo "=== Done! ==="