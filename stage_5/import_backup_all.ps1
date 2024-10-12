# applies existing backup

$ErrorActionPreference = "Stop"

$src="root"
$user="rast"

Copy-Item -Path  "$src/*" -Destination "C:/" -Recurse
reg import registry/ProcessExplorer.reg
reg import registry/7zip.reg
dism /online /Import-DefaultAppAssociations:"associations.xml"