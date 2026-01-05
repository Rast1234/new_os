# extracts useful settings accessible only from live system

$ErrorActionPreference = "Stop"

New-Item -ItemType Directory registry

reg export "HKEY_CURRENT_USER\SOFTWARE\Sysinternals\Process Explorer" registry/ProcessExplorer.reg
reg export "HKEY_CURRENT_USER\SOFTWARE\7-Zip" registry/7zip.reg
dism /online /Export-DefaultAppAssociations:"associations.xml"