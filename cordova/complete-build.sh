#!/bin/bash
# Shadow Legends - Complete Build Script for Mac/Linux
# This script automates the entire APK build process
# Usage: bash cordova/complete-build.sh

set -e

echo ""
echo "========================================="
echo "  Shadow Legends - APK Build System"
echo "  Mac/Linux Version"
echo "========================================="
echo ""

echo "[1/8] Checking Node.js installation..."
if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js not found. Install from https://nodejs.org/"
    exit 1
fi
echo "OK: Node.js $(node --version) installed"

echo "[2/8] Checking Java installation..."
if ! command -v java &> /dev/null; then
    echo "ERROR: Java not found. Install JDK 11+"
    exit 1
fi
echo "OK: Java installed"

echo "[3/8] Checking Android SDK..."
if [ -z "$ANDROID_SDK_ROOT" ]; then
    if [ -d "$HOME/Library/Android/sdk" ]; then
        export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
        echo "OK: Auto-detected macOS Android SDK"
    elif [ -d "$HOME/Android/Sdk" ]; then
        export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
        echo "OK: Auto-detected Linux Android SDK"
    else
        echo "ERROR: Android SDK not found. Install Android Studio."
        exit 1
    fi
fi
echo "OK: Android SDK: $ANDROID_SDK_ROOT"

echo "[4/8] Checking Cordova..."
if ! command -v cordova &> /dev/null; then
    echo "INFO: Installing Cordova globally..."
    npm install -g cordova@latest
fi
echo "OK: Cordova $(cordova --version) ready"

echo "[5/8] Setting up Cordova project..."
if [ ! -d "shadowlegends-app" ]; then
    echo "INFO: Creating new Cordova project..."
    cordova create shadowlegends-app com.shadowlegends.game "Shadow Legends"
    cd shadowlegends-app
    cordova platform add android
    cd ..
    echo "OK: Cordova project created"
else
    echo "OK: Cordova project already exists"
fi

echo "[6/8] Copying game files..."
cp index.html shadowlegends-app/www/
if [ -f "cordova/config.xml" ]; then
    cp cordova/config.xml shadowlegends-app/
fi
echo "OK: Game files copied"

echo "[7/8] Cleaning previous builds..."
cd shadowlegends-app
cordova clean
echo "OK: Clean complete"

echo "[8/8] Building APK (this may take 2-5 minutes)..."
echo "INFO: Please wait..."
cordova build android --debug

echo ""
echo "========================================="
echo "        BUILD SUCCESSFUL!"
echo "========================================="
echo ""
echo "APK Location:"
echo "   $(pwd)/platforms/android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "APK Size:"
ls -lh platforms/android/app/build/outputs/apk/debug/app-debug.apk | awk '{print "   " $5}'
echo ""
echo "Install on Device:"
echo "   adb install -r platforms/android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "Play!"
echo "   Look for 'Shadow Legends' on your Android home screen"
echo ""
echo "Build Release APK (for publishing):"
echo "   cordova build android --release"
echo ""
echo "Enjoy Shadow Legends! ⚔️"
echo ""
