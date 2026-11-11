Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Bitmap]::FromFile((Resolve-Path "assets/logo-emunah.png"))
$w = $src.Width
$h = $src.Height

# Let's inspect colors at corners:
$cTL = $src.GetPixel(4, 4)
$cTR = $src.GetPixel($w - 5, 4)
$cBL = $src.GetPixel(4, $h - 5)
$cBR = $src.GetPixel($w - 5, $h - 5)

Write-Host "TL: $($cTL.R), $($cTL.G), $($cTL.B)"
Write-Host "TR: $($cTR.R), $($cTR.G), $($cTR.B)"
Write-Host "BL: $($cBL.R), $($cBL.G), $($cBL.B)"
Write-Host "BR: $($cBR.R), $($cBR.G), $($cBR.B)"

$src.Dispose()
