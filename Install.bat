@echo off

setlocal

set "DesktopPath=%USERPROFILE%\Desktop"

set "FolderPath=%DesktopPath%\sing-box"
if not exist "%FolderPath%" (
    mkdir "%FolderPath%"
)

cd /d "%FolderPath%"

curl -s "https://mirror.ghproxy.com/https://raw.githubusercontent.com/DustinWin/clash_singbox-tools/main/sing-box-release/sing-box-windows-amd64.exe" -o sing-box.exe
curl -s "https://mirror.ghproxy.com/https://github.com/winsw/winsw/releases/latest/download/WinSW-x64.exe" -o sing-box-service.exe
curl -s "https://mirror.ghproxy.com/https://gist.githubusercontent.com/krisstibex/aec44f359d82c8694c4619c40c902e96/raw/sing-box-manager.bat" -o sing-box-manager.bat
curl -s "https://mirror.ghproxy.com/https://gist.githubusercontent.com/krisstibex/aec44f359d82c8694c4619c40c902e96/raw/sing-box-service.xml" -o sing-box-service.xml

endlocal
