#Run with:
#  powershell -noexit -ExecutionPolicy Bypass -File "C:\Users\badusb\Desktop\wpchange.ps1"

Invoke-Webrequest -Uri "https://github.com/Worpaaja/wallpaperchanger/blob/main/asciiwallpaper.jpeg?raw=true" -Outfile "C:\temp\newwp.jpeg"

$MyImage = "c:\temp\newwp.jpeg"

$settings = "Get-Process -Name SystemSettings -ErrorAction SilentlyContinue"

if (-not $settings) { 
    Start-Process "ms-settings:" 
    Start-Sleep -Seconds 1 
}

Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name 'WallPaper' -Value $MyImage
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name 'WallpaperStyle' -Value 2
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name 'TileWallpaper' -Value 0

RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters 1, True
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters

if (-not $settings) { 
    Start-Sleep -Seconds 1 
    Stop-Process -Name "SystemSettings" 
}
