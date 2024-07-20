cls

$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$folderPath = Join-Path -Path $desktopPath -ChildPath "sing-box"
New-Item -ItemType Directory -Path $folderPath -Force
Set-Location -Path $folderPath

Write-Host ""
Write-Host "================================"
Write-Host " Sing-Box Manager Downloader"
Write-Host "================================"
Write-Host ""

Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/gh/DustinWin/clash_singbox-tools@main/sing-box-release/sing-box-windows-amd64.exe" -OutFile "sing-box.exe" -ErrorAction Stop
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/gh/winsw/winsw@releases/latest/download/WinSW-x64.exe" -OutFile "sing-box-service.exe" -ErrorAction Stop
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/gh/krisstibex/sing-box-manager@main/sing-box-manager.ba" -OutFile "sing-box-manager.bat" -ErrorAction Stop
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/gh/krisstibex/sing-box-manager@main/sing-box-service.xml" -OutFile "sing-box-service.xml" -ErrorAction Stop

Write-Host "Done."
Start-Sleep -Seconds 5
exit
