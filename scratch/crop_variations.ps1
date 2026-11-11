Add-Type -AssemblyName System.Drawing

$srcPath = (Get-Item "design-systems\barbearia-emunah\reference.jpg").FullName
$img = [System.Drawing.Image]::FromFile($srcPath)

$variations = @(
    @{ Name = "logo-emunah.png"; X = 42; Y = 52; W = 158; H = 150 },
    @{ Name = "logo-opt1.png"; X = 38; Y = 48; W = 166; H = 158 },
    @{ Name = "logo-opt2.png"; X = 45; Y = 55; W = 150; H = 144 }
)

foreach ($v in $variations) {
    $rect = New-Object System.Drawing.Rectangle($v.X, $v.Y, $v.W, $v.H)
    $bmp = New-Object System.Drawing.Bitmap($v.W, $v.H)
    $graphics = [System.Drawing.Graphics]::FromImage($bmp)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $graphics.DrawImage($img, (New-Object System.Drawing.Rectangle(0, 0, $v.W, $v.H)), $rect, [System.Drawing.GraphicsUnit]::Pixel)

    $outPath = (Get-Item ".").FullName + "\assets\" + $v.Name
    $bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bmp.Dispose()
    Write-Host "Generated: $outPath"
}

$img.Dispose()
