echo "=== Configuring power profiles ==="
reg import power.reg
# idk if required, but won't hurt
powercfg /hibernate on

echo "Power profiles: initial state"
powercfg list
echo ""

$originals = powercfg list | ForEach-Object {
    if ($_ -match '^Power Scheme GUID:\s*([-0-9a-f]+)\s*\(([^)]+)\)\s*(\*)?') {
        [PsCustomObject]@{
            Id = $matches[1]
            Name = $matches[2]
            Active = $matches[3] -eq '*'
        }
    }
}

# for some reason, FULL PATH is required or imported profile won't work
$plan=(Resolve-Path .\custom.pow).Path
powercfg import $plan 381b4222-f694-41f0-9685-000000000001
powercfg setactive 381b4222-f694-41f0-9685-000000000001
$originals | foreach {
    $name="$env:TMP/$($_.Name).pow.bak"
    powercfg export $name $_.Id
    echo "Power profiles: created backup $name"
    powercfg delete $_.Id
}
echo ""
echo "Power profiles: final state"
powercfg list
echo ""