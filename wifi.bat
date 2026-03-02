@echo off
setlocal enabledelayedexpansion
title WiFi Password Viewer
color 0A

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ============================================
    echo This script requires Administrator privileges
    echo Please run as Administrator
    echo ============================================
    pause
    exit /b 1
)

echo.
echo ============================================
echo         WiFi Password Recovery Tool
echo ============================================
echo.

:: Create results file with timestamp
set "timestamp=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "timestamp=!timestamp: =0!"
set "outputfile=WiFi_Passwords_!timestamp!.txt"

echo WiFi Password Recovery Results > "!outputfile!"
echo Generated on: %date% %time% >> "!outputfile!"
echo ============================================ >> "!outputfile!"
echo. >> "!outputfile!"

:: Display all WiFi profiles
echo Scanning for saved WiFi profiles...
echo.
echo ============================================
echo          SAVED WIFI NETWORKS
echo ============================================
echo.

:: Counter for networks
set /a count=0

:: Get all profiles and process each one
for /f "tokens=1* delims=:" %%a in ('netsh wlan show profiles ^| findstr /c:"All User Profile"') do (
    set "profile=%%b"
    :: Remove leading spaces
    for /f "tokens=* delims= " %%c in ("!profile!") do set "profile=%%c"
    
    set /a count+=1
    echo [!count!] !profile!
    echo.
    
    :: Write profile header to file
    echo -------------------------------------------- >> "!outputfile!"
    echo Network #!count!: !profile! >> "!outputfile!"
    echo -------------------------------------------- >> "!outputfile!"
    
    :: Get the password for this profile
    set "key_found=false"
    for /f "tokens=1* delims=:" %%d in ('netsh wlan show profile "!profile!" key^=clear 2^>nul ^| findstr /c:"Key Content"') do (
        set "password=%%e"
        :: Remove leading spaces from password
        for /f "tokens=* delims= " %%f in ("!password!") do set "password=%%f"
        
        echo    SSID: !profile!
        echo    Password: !password!
        echo.
        
        :: Write to file
        echo SSID: !profile! >> "!outputfile!"
        echo Password: !password! >> "!outputfile!"
        echo. >> "!outputfile!"
        
        set "key_found=true"
    )
    
    :: If no password found
    if "!key_found!"=="false" (
        echo    SSID: !profile!
        echo    Password: [No password saved/Open network]
        echo.
        
        :: Write to file
        echo SSID: !profile! >> "!outputfile!"
        echo Password: [No password saved/Open network] >> "!outputfile!"
        echo. >> "!outputfile!"
    )
)

echo ============================================
echo.

if !count! equ 0 (
    echo No saved WiFi profiles found.
    echo No saved WiFi profiles found. >> "!outputfile!"
) else (
    echo Total networks found: !count!
    echo.
    echo Results have been saved to: !outputfile!
    echo.
    
    :: Add summary to file
    echo ============================================ >> "!outputfile!"
    echo Total networks found: !count! >> "!outputfile!"
    
    :: Option to open the file
    choice /C YN /M "Do you want to open the results file now"
    if errorlevel 2 (
        echo.
    ) else (
        start "" "!outputfile!"
    )
)

echo.
echo ============================================
echo Press any key to exit...
pause >nul