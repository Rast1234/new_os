echo "Languages: initial state"
Get-WinUserLanguageList

Set-WinUserLanguageList -LanguageList en-US, ru-RU -Force
./KBDen_amd64.msi /quiet
./KBDrus_amd64.msi /quiet
echo "Languages: list with custom layout installed"
Get-WinUserLanguageList

# NOTE: DO NOT IMPORT IN VM if host has layout hacks applied!
$machine=Get-CimInstance win32_computersystem | select -ExpandProperty Model
if( ! $machine.ToLower().Contains('virtual')){
    reg import lang.reg
    echo "Languages: imported reg overrides"
}
else {
    echo "Languages: running in VM, skipped reg overrides"
}
