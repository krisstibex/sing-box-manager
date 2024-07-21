Clear-Host

$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$folderPath = Join-Path -Path $desktopPath -ChildPath "sing-box"
New-Item -ItemType Directory -Path $folderPath -Force
Set-Location -Path $folderPath

Clear-Host

Write-Host ""
Write-Host "================================"
Write-Host " Sing-Box Manager Downloader"
Write-Host "================================"
Write-Host ""

$userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"

Invoke-WebRequest -Uri "https://mirror.ghproxy.com/https://raw.githubusercontent.com/DustinWin/clash_singbox-tools/main/sing-box-release/sing-box-windows-amd64.exe" -OutFile "sing-box.exe" -ErrorAction Stop -Headers @{ "User-Agent" = $userAgent } > $null 2>&1
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/https://github.com/winsw/winsw/releases/latest/download/WinSW-x64.exe" -OutFile "sing-box-service.exe" -ErrorAction Stop -Headers @{ "User-Agent" = $userAgent } > $null 2>&1
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/https://raw.githubusercontent.com/krisstibex/sing-box-manager/main/sing-box-manager.bat" -OutFile "sing-box-manager.bat" -ErrorAction Stop -Headers @{ "User-Agent" = $userAgent } > $null 2>&1
Invoke-WebRequest -Uri "https://mirror.ghproxy.com/https://raw.githubusercontent.com/krisstibex/sing-box-manager/main/sing-box-service.xml" -OutFile "sing-box-service.xml" -ErrorAction Stop -Headers @{ "User-Agent" = $userAgent } > $null 2>&1

Write-Host "Done."
Start-Sleep -Seconds 5
Exit-PSSession
