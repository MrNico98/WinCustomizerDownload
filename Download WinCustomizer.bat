@echo off
setlocal enabledelayedexpansion
mode 60,20

echo ==================
echo      [1] GUI
echo      [2] Script
echo ==================
choice /C:12 /N /M "Digita un numero: "
if "%errorlevel%" equ "2" ( goto :wincscript )
if "%errorlevel%" equ "1" ( goto :wincgui )

:wincgui
powershell write-host -fore red "Disabilita il tuo antivirus poi premi [y] per continuare"
choice /C:Y /N
if errorlevel equ 1 (
powershell -command "irm -Uri https://bit.ly/WinCustomizerExe | iex"
)
goto :end

:wincscript
powershell -command "irm -Uri https://bit.ly/WinCustomizer | iex"

:end
cls
endlocal
exit