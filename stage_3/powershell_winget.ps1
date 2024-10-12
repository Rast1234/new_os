Install-PackageProvider NuGet -Force
Install-Module PSWindowsUpdate -Force
Update-Help # will fail some modules, its OK

# NOTE: winget will update choco packages, we dont want that! Run this script before choco install
winget update --all --accept-source-agreements --accept-package-agreements
# NOTE: will open window
winget install BartoszCichecki.LenovoLegionToolkit  --accept-source-agreements --accept-package-agreements
