# set user profile picture
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw "Run as admin!"
}

Function ResizeImage {
    Param ($src, [int]$size)

    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    $img = [System.Drawing.Image]::FromFile($src, $true)
    $result = New-Object System.Drawing.Bitmap($size, $size)
    $g = [System.Drawing.Graphics]::FromImage($result)
    #$g.Clear([System.Drawing.Color]::White)
    $g.SmoothingMode = "HighQuality"
    $g.InterpolationMode = "HighQualityBicubic"
    $g.PixelOffsetMode = "HighQuality"
    $g.DrawImage($img, 0, 0 , $size, $size)
    
    $ms = New-Object IO.MemoryStream
    $params = New-Object System.Drawing.Imaging.EncoderParameters(1)
    $params.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, 100)
    $codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/png' }
    $result.Save($ms, $codec, $params)
    $result.Dispose()
    $img.Dispose()
    return $ms.ToArray()
}

$dir = "c:\bin\pictures"
$src = "${dir}\user.png"

$sid = (New-Object System.Security.Principal.NTAccount($env:UserName)).Translate([System.Security.Principal.SecurityIdentifier]).Value
$reg_key = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AccountPicture\Users\$sid"
$sizes = @(96, 448, 32, 40, 48, 192, 240, 64, 208, 424, 1080)
ForEach ($size in $sizes) {
    $dst = "${dir}\user_${size}.png"
    ResizeImage $src $size | Set-Content -Path $dst -Encoding Byte -Force
    $reg_name = "Image${size}"
    $command = "REG ADD `"$reg_key`" /V `"$reg_name`" /T REG_SZ /D `"${dst}`" /F"
    psexec -accepteula -nobanner -s cmd /c $command
    echo "done: $reg_name"
}
