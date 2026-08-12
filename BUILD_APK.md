# Shadow Legends - APK Build Guide

## Prerequisites

Before building the APK, install:

1. **Node.js** (v14 or higher)
   - Download: https://nodejs.org/
   - Verify: `node --version` and `npm --version`

2. **Java Development Kit (JDK)**
   - Download Java 11: https://www.oracle.com/java/technologies/javase-jdk11-downloads.html
   - Set JAVA_HOME environment variable

3. **Android SDK**
   - Download Android Studio: https://developer.android.com/studio
   - Install via Android Studio's SDK Manager (API 19-32)
   - Set ANDROID_SDK_ROOT environment variable

4. **Gradle** (included with Android Studio)

---

## Quick Build Steps

### Step 1: Install Cordova Globally
```bash
npm install -g cordova@latest
```

### Step 2: Clone or Navigate to Repo
```bash
cd Shadow-legends
```

### Step 3: Create Cordova Project (First Time Only)
```bash
cordova create shadowlegends-app com.shadowlegends.game "Shadow Legends"
cd shadowlegends-app
```

### Step 4: Add Android Platform
```bash
cordova platform add android
```

### Step 5: Copy Game Files
```bash
# Copy your index.html to www folder
cp ../index.html www/
```

### Step 6: Copy Config
```bash
# Replace config.xml with the one from the repo
cp ../cordova/config.xml .
```

### Step 7: Build APK (Debug)
```bash
cordova build android --debug
```

**APK Location:**
```
shadowlegends-app/platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

---

## Install on Android Device

### Option A: Using ADB (Android Debug Bridge)
```bash
# Enable USB Debugging on your Android phone
# Then run:
adb install -r platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

### Option B: Manual Installation
1. Copy `app-debug.apk` to your Android device
2. Open file manager and tap the APK
3. Allow installation from unknown sources
4. Tap "Install"

---

## Build Release APK (For Publishing)

```bash
cordova build android --release
```

**APK Location:**
```
shadowlegends-app/platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk
```

### Sign Release APK
```bash
# Generate key (one-time)
keytool -genkey -v -keystore my-release-key.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias

# Sign APK
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore app-release-unsigned.apk my-key-alias

# Optimize (optional)
zipalign -v 4 app-release-unsigned.apk app-release-signed.apk
```

---

## Troubleshooting

### "cordova: command not found"
```bash
sudo npm install -g cordova@latest
```

### "ANDROID_SDK_ROOT not set"
```bash
# Linux/Mac
export ANDROID_SDK_ROOT=/path/to/android/sdk

# Windows (Command Prompt)
set ANDROID_SDK_ROOT=C:\Users\YourName\AppData\Local\Android\Sdk
```

### "JAVA_HOME not set"
```bash
# Linux/Mac
export JAVA_HOME=/path/to/jdk

# Windows
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.x
```

### Build Fails - Clean and Rebuild
```bash
cordova clean
cordova build android --debug
```

---

## Quick Command Summary

```bash
# Setup (one-time)
npm install -g cordova
cordova create shadowlegends-app com.shadowlegends.game "Shadow Legends"
cd shadowlegends-app
cordova platform add android
cp ../index.html www/
cp ../cordova/config.xml .

# Build
cordova build android --debug

# Test
adb install -r platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

---

## Next Steps

1. ✅ Download and install prerequisites
2. ✅ Run the build commands
3. ✅ Test on Android device
4. 📱 Share with friends!
5. 🚀 Publish to Google Play Store (optional)

---

## Resources

- [Cordova Docs](https://cordova.apache.org/docs/en/latest/)
- [Android Studio Setup](https://developer.android.com/studio/intro)
- [Google Play Publishing](https://developer.android.com/studio/publish)
