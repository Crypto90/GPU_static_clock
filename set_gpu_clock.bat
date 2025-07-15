@echo off
:: Elevation check
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo.
    echo This script requires administrator privileges.
    echo Relaunching as administrator...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:: Set full path if needed
set NSMI=nvidia-smi

:: Set graphics clock only
set GRAPHICS_CLOCK=2715

echo Locking GPU graphics clock to %GRAPHICS_CLOCK% MHz...
%NSMI% -lgc %GRAPHICS_CLOCK%,%GRAPHICS_CLOCK%

:: Confirm
echo ------------------------
echo Current GPU Clock Settings:
%NSMI% -q -d CLOCK
echo ------------------------

:: pause
