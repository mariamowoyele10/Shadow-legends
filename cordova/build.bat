@echo off
REM Shadow Legends - Automated APK Build Script (Windows)
REM Usage: build.bat

color 0A
echo.
echo ========================================
echo ^|  Shadow Legends - APK Build Script  ^
 echo ========================================
echo.

REM Check if Cordova is installed
where cordova >nul 2>nul
if %errorlevel% neq 0 (
    echo [!] Cordova not found. Installing...
    call npm install -g cordova@latest
)

echo [+] Cordova found
for /f "tokens=*" %%i in ('cordova --version') do set CORDOVA_VERSION=%%i
echo [+] Version: %CORDOVA_VERSION%
echo.

REM Check ANDROID_SDK_ROOT
if "%ANDROID_SDK_ROOT%"==" " (
    echo [!] ANDROID_SDK_ROOT not set. Auto-detecting...
    if exist "%USERPROFILE%\AppData\Local\Android\Sdk" (
        set ANDROID_SDK_ROOT=%USERPROFILE%\AppData\Local\Android\Sdk
        echo [+] Found: %ANDROID_SDK_ROOT%
    ) else (
        echo [-] Android SDK not found. Please install Android Studio.
        pause
        exit /b 1
    )
) else (
    echo [+] ANDROID_SDK_ROOT: %ANDROID_SDK_ROOT%
)
echo.

REM Create Cordova app if not exists
if not exist "shadowlegends-app" (
    echo [*] Creating Cordova project...
    call cordova create shadowlegends-app com.shadowlegends.game "Shadow Legends"
    cd shadowlegends-app
    call cordova platform add android
    cd ..
) else (
    echo [+] Cordova project exists
)

echo.
echo [*] Copying game files...
copy index.html shadowlegends-app\www\ >nul
copy cordova\config.xml shadowlegends-app\ >nul
echo [+] Files copied
echo.
echo [*] Building APK...
echo [!] This may take 2-5 minutes...
echo.

cd shadowlegends-app

call cordova clean
call cordova build android --debug

echo.
echo ========================================
echo [+] BUILD COMPLETE!
echo ========================================
echo.
echo [*] APK Location:
echo    %CD%\platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo [*] To install on device (USB connected):
echo    adb install -r platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo [*] To build release APK:
echo    cordova build android --release
echo.
pause
