@echo off

:: Check for administrative privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo.
    echo This script requires administrator privileges.
    echo Attempting to relaunch as administrator...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)


@echo off
set NSMI=nvidia-smi
%NSMI% -rgc
echo GPU clock reverted to dynamic mode.



:: Confirm
echo ------------------------
echo Current GPU Clock Settings:
%NSMI% -q -d CLOCK
echo ------------------------


:: pause

