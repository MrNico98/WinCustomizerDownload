@echo off
setlocal enabledelayedexpansion
mode 60,20

echo ==============================
echo   [1] Script
echo ==============================
choice /C:1 /N /M "Digita un numero: "
if "%errorlevel%" equ "" ( goto :wincscript )

:wincscript
powershell -command "irm -Uri https://bit.ly/WinCustomizer | iex"

:end
cls
endlocal
exit
