@echo off
cls
title Deep Windows 11 Cleanup
color 0A

echo ============================================
echo   WINDOWS 11 DEEP CLEANUP SCRIPT (CMD)
echo   Run as Administrator
echo ============================================
echo.

:: Confirm admin rights
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo [ERROR] Please run this script as Administrator.
    pause
    exit
)

echo [1] Cleaning TEMP folders...
del /f /s /q %temp%\* >nul
del /f /s /q C:\Windows\Temp\* >nul

echo [2] Cleaning Prefetch files...
del /f /s /q C:\Windows\Prefetch\* >nul

echo [3] Cleaning SoftwareDistribution (Windows Update Cache)...
net stop wuauserv >nul
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul
net start wuauserv >nul

echo [4] Emptying Recycle Bin...
PowerShell.exe -Command "Clear-RecycleBin -Force" >nul

echo [5] Flushing DNS cache...
ipconfig /flushdns

echo [6] Clearing Event Logs...
for /F %%e in ('wevtutil.exe el') do wevtutil.exe cl "%%e"

echo [7] Running Disk Cleanup silently...
cleanmgr /sagerun:1

echo [8] Optimizing Drives...
defrag C: /O

echo.
echo ============================================
echo   CLEANUP COMPLETE
echo ============================================
pause