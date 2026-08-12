@echo off
REM Shadow Legends - Complete Build Script for Windows
REM Usage: complete-build.bat

setlocal enabledelayedexpansion
color 0A

echo.
echo =========================================
echo   Shadow Legends - APK Build System
echo   Windows Version
echo =========================================
echo.

echo [1/8] Checking Node.js installation...
where node >nul 2>nul
if errorlevel 1 (
    echo ERROR: Node.js not found. Install from https://nodejs.org/
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo OK: Node.js %NODE_VERSION% installed
echo.

echo [2/8] Checking Java installation...
where java >nul 2>nul
if errorlevel 1 (
    echo ERROR: Java not found. Install JDK 11+
    pause
    exit /b 1
)
echo OK: Java installed
echo.

echo [3/8] Checking Android SDK...
if "%ANDROID_SDK_ROOT%"==" " (
    if exist "%USERPROFILE%\AppData\Local\Android\Sdk" (
        set ANDROID_SDK_ROOT=%USERPROFILE%\AppData\Local\Android\Sdk
        echo OK: Auto-detected Android SDK
    ) else (
        echo ERROR: Android SDK not found. Install Android Studio.
        echo https://developer.android.com/studio
        pause
        exit /b 1
    )
)
echo OK: Android SDK: %ANDROID_SDK_ROOT%
echo.

echo [4/8] Checking Cordova...
where cordova >nul 2>nul
if errorlevel 1 (
    echo INFO: Installing Cordova globally...
    call npm install -g cordova@latest
)
for /f "tokens=*" %%i in ('cordova --version') do set CORDOVA_VERSION=%%i
echo OK: Cordova %CORDOVA_VERSION% ready
echo.

echo [5/8] Setting up Cordova project...
if not exist "shadowlegends-app" (
    echo INFO: Creating new Cordova project...
    call cordova create shadowlegends-app com.shadowlegends.game "Shadow Legends"
    cd shadowlegends-app
    call cordova platform add android
    cd ..
    echo OK: Cordova project created
) else (
    echo OK: Cordova project already exists
)
echo.

echo [6/8] Copying game files...
copy index.html shadowlegends-app\www\ >nul 2>&1
if exist "cordova\config.xml" (
    copy cordova\config.xml shadowlegends-app\ >nul 2>&1
)
echo OK: Game files copied
echo.

echo [7/8] Cleaning previous builds...
cd shadowlegends-app
call cordova clean
echo OK: Clean complete
echo.

echo [8/8] Building APK (this may take 2-5 minutes)...
echo INFO: Please wait...
call cordova build android --debug

if errorlevel 1 (
    echo.
    echo ERROR: BUILD FAILED!
    echo INFO: Troubleshooting:
    echo - Ensure Java, Android SDK, and Node.js are installed
    echo - Check ANDROID_SDK_ROOT environment variable
    echo - Run: cordova clean
    echo - Try again
    pause
    exit /b 1
)

echo.
echo =========================================
echo        BUILD SUCCESSFUL!
echo =========================================
echo.
echo APK Location:
echo %CD%\platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo Install on Device (USB connected):
echo adb install -r platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo Play!
echo Look for 'Shadow Legends' on your Android home screen
echo.
echo Build Release APK (for publishing):
echo cordova build android --release
echo.
echo Enjoy Shadow Legends! ⚔️
echo.
pause
