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

wget "https://raw.githubusercontent.com/krisstibex/sing-box-manager/main/sing-box-manager.bat" -q -O "sing-box-manager.bat" --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
wget "https://raw.githubusercontent.com/krisstibex/sing-box-manager/main/sing-box-service.xml" -q -O "sing-box-service.xml" --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
wget "https://github.com/winsw/winsw/releases/latest/download/WinSW-x64.exe" -q -O "sing-box-service.exe" --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
wget "https://raw.githubusercontent.com/DustinWin/clash_singbox-tools/main/sing-box-release/sing-box-windows-amd64.exe" -q -O "sing-box.exe" --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"

Write-Host "Done."
Start-Sleep -Seconds 5
Exit-PSSession
