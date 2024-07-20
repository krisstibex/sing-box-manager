@echo off

setlocal

set "DesktopPath=%USERPROFILE%\Desktop"

set "FolderPath=%DesktopPath%\sing-box"
if not exist "%FolderPath%" (
    mkdir "%FolderPath%"
)

cd /d "%FolderPath%"

curl -s "https://cdn.jsdelivr.net/gh/DustinWin/clash_singbox-tools@main/sing-box-release/sing-box-windows-amd64.exe" -o sing-box.exe
curl -s "https://cdn.jsdelivr.net/gh/winsw/winsw@releases/latest/download/WinSW-x64.exe" -o sing-box-service.exe
curl -s "https://cdn.jsdelivr.net/gh/krisstibex/sing-box-manager@main/sing-box-manager.bat" -o sing-box-manager.bat
curl -s "https://cdn.jsdelivr.net/gh/krisstibex/sing-box-manager@main/sing-box-service.xml" -o sing-box-service.xml

endlocal
