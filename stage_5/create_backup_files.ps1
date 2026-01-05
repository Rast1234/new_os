# extracts useful files from offline backup

$ErrorActionPreference = "Stop"

#$src="E:/legion_root"
$src="C:"
$dst = "root"
$user="rast"

New-Item -ItemType Directory $dst

function CopyStuff {
    param ($path)
    $from = "$src/$path"
    $isDir = (Get-Item $from) -is [System.IO.DirectoryInfo]
    if($isDir){
        $to = "$dst/$path"
        echo "copy path $from -- $to"
        Copy-Item -Path $from -Destination $to -Recurse
    }
    else{
        $to = split-path "$dst/$path"
        echo "copy file $from -- $to"
        New-Item -ItemType Directory -Path $to -Force | Out-Null
        Copy-Item -Path $from -Destination $to
    }
    
}

CopyStuff("Users/$user/AppData/Local/qBittorrent")
CopyStuff("Users/$user/AppData/Roaming/Notepad++")
CopyStuff("Users/$user/AppData/Roaming/AIMP")
CopyStuff("Users/$user/AppData/Roaming/discord/settings.json")
CopyStuff("Users/$user/AppData/Roaming/discord/Local Storage")
CopyStuff("Users/$user/AppData/Roaming/FileZilla")
CopyStuff("Users/$user/AppData/Roaming/DS4Windows")
CopyStuff("Users/$user/AppData/Roaming/qBittorrent")
CopyStuff("Users/$user/AppData/Roaming/Code")
CopyStuff("Users/$user/AppData/Roaming/XnViewMP")
CopyStuff("Users/$user/AppData/Roaming/doublecmd")
CopyStuff("Users/$user/AppData/Roaming/vlc")
CopyStuff("Users/$user/Documents/ShareX")
CopyStuff("Users/$user/.ssh")
CopyStuff("Users/$user/.vscode")
CopyStuff("Users/$user/.gitconfig")
CopyStuff("ProgramData/PromDapter/Prometheusmapping.yaml")
CopyStuff("Program Files/HWiNFO64/HWiNFO64.EXE")
CopyStuff("Program Files/HWiNFO64/HWiNFO64.INI")
CopyStuff("Program Files/PromDapter")
CopyStuff("Program Files/prometheus/prometheus.exe")
CopyStuff("Program Files/prometheus/prometheus.yml")
CopyStuff("Program Files (x86)/Steam/config")
CopyStuff("Program Files (x86)/RivaTuner Statistics Server/Profiles")
CopyStuff("Program Files (x86)/RivaTuner Statistics Server/Plugins/Client/Overlays/_details.ovl")
CopyStuff("Program Files (x86)/RivaTuner Statistics Server/Plugins/Client/Overlays/_fps.ovl")
CopyStuff("Program Files/GrafanaLabs/grafana/data/grafana.db")

