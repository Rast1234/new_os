if ( !(Test-Path -Path "./bin") ) {
    throw "Script requires 'bin' directory in CWD"
}

$bin = "c:\bin"
New-Item -ItemType Directory -Path $bin -Force

$current = ([Environment]::GetEnvironmentVariable("PATH")).Split(";")
if(! $current.contains($bin)){
    $new = ($current + $bin) -Join ";"
    [Environment]::SetEnvironmentVariable("PATH", $new, [EnvironmentVariableTarget]::Machine)
    # PS won't see new path until restart
}

copy-item "./bin/*" $bin -Recurse
