$remoteBatUrl = "https://mirror.ghproxy.com/https://gist.githubusercontent.com/krisstibex/aec44f359d82c8694c4619c40c902e96/raw/Install.bat"
$tempBatFile = "$env:TEMP\Install.bat"

cls

Write-Host ""
Write-Host "================================"
Write-Host " Sing-Box Manager Downloader"
Write-Host "================================"
Write-Host ""

Invoke-WebRequest -Uri $remoteBatUrl -OutFile $tempBatFile -ErrorAction Stop
& cmd.exe /c $tempBatFile
Remove-Item $tempBatFile -ErrorAction SilentlyContinue

Write-Host "Done."
Start-Sleep -Seconds 5
exit
