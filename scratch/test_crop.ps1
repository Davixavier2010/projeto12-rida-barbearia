Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Image]::FromFile((Resolve-Path "design-systems/barbearia-emunah/reference.jpg"))

# Let's inspect the top-left area where the logo is
$cropW = 190
$cropH = 190
$cropX = 30
$cropY = 35

$bmp = New-Object System.Drawing.Bitmap($cropW, $cropH)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$rectSrc = New-Object System.Drawing.Rectangle($cropX, $cropY, $cropW, $cropH)
$rectDst = New-Object System.Drawing.Rectangle(0, 0, $cropW, $cropH)
$g.DrawImage($src, $rectDst, $rectSrc, [System.Drawing.GraphicsUnit]::Pixel)

$bmp.Save((Resolve-Path "scratch").Path + "\test_logo_square.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()
$src.Dispose()
Write-Output "Saved test_logo_square.png"
