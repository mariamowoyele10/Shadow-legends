#!/bin/bash
# Shadow Legends - Automated APK Build Script
# Usage: bash build.sh

set -e

echo "🎮 Shadow Legends - APK Build Script"
echo "====================================="
echo ""

# Check if Cordova is installed
if ! command -v cordova &> /dev/null; then
    echo "❌ Cordova not found. Installing..."
    npm install -g cordova@latest
fi

echo "✅ Cordova found: $(cordova --version)"
echo ""

# Check if ANDROID_SDK_ROOT is set
if [ -z "$ANDROID_SDK_ROOT" ]; then
    echo "⚠️  ANDROID_SDK_ROOT not set. Attempting to auto-detect..."
    if [ -d "$HOME/Android/Sdk" ]; then
        export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
        echo "✅ Found Android SDK at: $ANDROID_SDK_ROOT"
    else
        echo "❌ Please set ANDROID_SDK_ROOT environment variable"
        exit 1
    fi
fi

echo "✅ ANDROID_SDK_ROOT: $ANDROID_SDK_ROOT"
echo ""

# Create Cordova app if it doesn't exist
if [ ! -d "shadowlegends-app" ]; then
    echo "📦 Creating Cordova project..."
    cordova create shadowlegends-app com.shadowlegends.game "Shadow Legends"
    cd shadowlegends-app
    cordova platform add android
    cd ..
else
    echo "✅ Cordova project already exists"
fi

echo ""
echo "📋 Copying game files..."
cp index.html shadowlegends-app/www/
cp cordova/config.xml shadowlegends-app/

echo "✅ Files copied"
echo ""
echo "🔨 Building APK..."
echo "This may take 2-5 minutes..."
echo ""

cd shadowlegends-app

# Clean previous builds
cordova clean

# Build debug APK
cordova build android --debug

echo ""
echo "✅ BUILD COMPLETE!"
echo ""
echo "📱 APK Location:"
echo "   $(pwd)/platforms/android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "🚀 To install on device (via USB):"
echo "   adb install -r platforms/android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "📦 To build release APK:"
echo "   cordova build android --release"
echo ""
