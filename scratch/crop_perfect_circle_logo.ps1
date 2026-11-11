Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Image]::FromFile((Resolve-Path "design-systems/barbearia-emunah/reference.jpg"))

# Exact emblem center: X = 122, Y = 124
# Size: 164 x 164 gives margin for ribbons and flourish
$size = 164
$cropX = 122 - ($size / 2) # 40
$cropY = 124 - ($size / 2) # 42

$bmp = New-Object System.Drawing.Bitmap($size, $size)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality

$rectSrc = New-Object System.Drawing.Rectangle($cropX, $cropY, $size, $size)
$rectDst = New-Object System.Drawing.Rectangle(0, 0, $size, $size)
$g.DrawImage($src, $rectDst, $rectSrc, [System.Drawing.GraphicsUnit]::Pixel)

$outPath = (Resolve-Path "assets").Path + "\logo-emunah.png"
$bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)

# Also copy to design-systems/barbearia-emunah/assets/
$outPath2 = (Resolve-Path "design-systems/barbearia-emunah/assets").Path + "\logo-emunah.png"
$bmp.Save($outPath2, [System.Drawing.Imaging.ImageFormat]::Png)

$g.Dispose()
$bmp.Dispose()
$src.Dispose()

Write-Output "Perfect centered logo saved to $outPath ($size x $size)"
