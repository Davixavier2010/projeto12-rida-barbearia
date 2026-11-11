Add-Type -AssemblyName System.Drawing

$srcPath = (Get-Item "design-systems\barbearia-emunah\reference.jpg").FullName
$img = [System.Drawing.Image]::FromFile($srcPath)
Write-Host "Reference image dimensions: $($img.Width) x $($img.Height)"

# Logo crop coordinates in reference.jpg:
# The circular emblem is inside x: [40, 260], y: [48, 200]
$x = [int]($img.Width * 0.052)
$y = [int]($img.Height * 0.046)
$w = [int]($img.Width * 0.22)
$h = [int]($img.Width * 0.22)

$rect = New-Object System.Drawing.Rectangle($x, $y, $w, $h)
$bmp = New-Object System.Drawing.Bitmap($w, $h)
$graphics = [System.Drawing.Graphics]::FromImage($bmp)
$graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$graphics.DrawImage($img, (New-Object System.Drawing.Rectangle(0, 0, $w, $h)), $rect, [System.Drawing.GraphicsUnit]::Pixel)

$outPath = (Get-Item ".").FullName + "\assets\logo-emunah.png"
$bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)

$graphics.Dispose()
$bmp.Dispose()
$img.Dispose()

Write-Host "Saved high-res logo to: $outPath ($w x $h)"
