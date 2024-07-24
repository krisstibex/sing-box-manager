@echo off
title Sing-Box Manager

setlocal
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    powershell -command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set EXE_FILE=sing-box.exe
set "REG_PATH=HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"
reg add "%REG_PATH%" /v "%~dp0%EXE_FILE%" /d "RUNASADMIN" /f

:menu
echo.
echo ==============================================
echo.
echo         Sing-Box Manager by Miku404
echo.
echo ==============================================
echo.
echo 1. Start Sing-Box Service
echo 2. Stop Sing-Box Service
echo 3. Open MetaCubeXD Dashboard
echo 4. Download My Own Config
echo 5. Exit
echo.
choice /c 12345 /n /m "Please make a choice: "
set choice=%errorlevel%

if %choice%==1 goto start
if %choice%==2 goto stop
if %choice%==3 goto panel
if %choice%==4 goto download
if %choice%==5 goto end

:start
cd /d %~dp0 && .\sing-box-service.exe install && .\sing-box-service.exe start
echo Service Started
timeout /t 3 /nobreak >nul
cls
goto menu

:stop
cd /d %~dp0 && .\sing-box-service.exe stop && .\sing-box-service.exe uninstall
echo Service Stopped
timeout /t 3 /nobreak >nul
cls
goto menu

:panel
start "http://127.0.0.1:9090"
echo Dashboard Opened
timeout /t 3 /nobreak >nul
cls
goto menu

:download
curl --max-time 15 -o config.json "Your Subscribe URL"
echo Download Success
timeout /t 3 /nobreak >nul
cls
goto menu

:end
exit
