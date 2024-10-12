# extracts useful files from offline backup

$ErrorActionPreference = "Stop"

New-Item -ItemType Directory root

$src="E:/legion_root"
$user="rast"

# folders
Copy-Item -Path "$src/Users/$user/AppData/Roaming/Notepad++" -Destination "root/Users/$user/AppData/Roaming/Notepad++" -Recurse
Copy-Item -Path "$src/Users/$user/AppData/Roaming/AIMP" -Destination "root/Users/$user/AppData/Roaming/AIMP" -Recurse
Copy-Item -Path "$src/Users/$user/AppData/Roaming/FileZilla" -Destination "root/Users/$user/AppData/Roaming/FileZilla" -Recurse
Copy-Item -Path "$src/Users/$user/AppData/Roaming/DS4Windows" -Destination "root/Users/$user/AppData/Roaming/DS4Windows" -Recurse
Copy-Item -Path "$src/Users/$user/AppData/Roaming/qBittorrent" -Destination "root/Users/$user/AppData/Roaming/qBittorrent" -Recurse
Copy-Item -Path "$src/Users/$user/AppData/Roaming/Code" -Destination "root/Users/$user/AppData/Roaming/Code" -Recurse
Copy-Item -Path "$src/Users/$user/AppData/Roaming/XnViewMP" -Destination "root/Users/$user/AppData/Roaming/XnViewMP" -Recurse
Copy-Item -Path "$src/Users/$user/AppData/Roaming/doublecmd" -Destination "root/Users/$user/AppData/Roaming/doublecmd" -Recurse
Copy-Item -Path "$src/Users/$user/AppData/Roaming/vlc" -Destination "root/Users/$user/AppData/Roaming/vlc" -Recurse

Copy-Item -Path "$src/Users/$user/AppData/Local/GOG.com" -Destination "root/Users/$user/AppData/Local/GOG.com" -Recurse
Copy-Item -Path "$src/Users/$user/AppData/Local/qBittorrent" -Destination "root/Users/$user/AppData/Local/qBittorrent" -Recurse

Copy-Item -Path "$src/Users/$user/Documents/ShareX" -Destination "root/Users/$user/Documents/ShareX" -Recurse
Copy-Item -Path "$src/Users/$user/.ssh" -Destination "root/Users/$user/.ssh" -Recurse
Copy-Item -Path "$src/Users/$user/.vscode" -Destination "root/Users/$user/.vscode" -Recurse
Copy-Item -Path "$src/Program Files (x86)/Steam/config" -Destination "root/Program Files (x86)/Steam/config" -Recurse

# files
Copy-Item -Path "$src/Users/$user/.gitconfig" -Destination "root/Users/$user" -Recurse
