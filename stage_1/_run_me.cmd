start powershell -command Start-Process powershell -verb RunAs -ArgumentList '-NoExit -Command "Set-ExecutionPolicy Bypass -Force; Set-Location ''%CD%''; ./script.ps1"'
