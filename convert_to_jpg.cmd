@echo off
setlocal ENABLEDELAYEDEXPANSION

set "SCRIPT=C:\heic2jpg\convert_to_jpg.ps1"
if not exist "%SCRIPT%" (
	echo [heic2jpg] Script not found: %SCRIPT%>&2
	exit /b 2
)

REM Forward all arguments, preserving quotes
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT%" %*
set "CODE=%ERRORLEVEL%"
if not "%CODE%"=="0" (
	echo [heic2jpg] PowerShell exited with code %CODE%>&2
)

endlocal & exit /b %CODE%

