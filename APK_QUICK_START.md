# 🚀 Shadow Legends APK - Quick Start Guide

## ⚡ Fastest Way to Get APK

### **Option 1: Online Converter (2 minutes - No Setup Required)**

**Use PWA Builder:**
1. Go to https://www.pwabuilder.com/
2. Enter: `https://raw.githubusercontent.com/mariamowoyele10/Shadow-legends/main/index.html`
3. Click "Build My PWA"
4. Download the Android APK
5. Install on phone

✅ **Pros:** Instant, no installation required
❌ **Cons:** Limited customization

---

### **Option 2: Local Build with Cordova (15 minutes - Full Control)**

#### **Windows Users:**
1. Install [Node.js](https://nodejs.org/)
2. Install [Android Studio](https://developer.android.com/studio)
3. Download this repo as ZIP
4. Extract and open folder in Command Prompt
5. Run: `build.bat`
6. Wait 2-5 minutes
7. APK will be in: `shadowlegends-app/platforms/android/app/build/outputs/apk/debug/app-debug.apk`

#### **Mac/Linux Users:**
1. Install [Node.js](https://nodejs.org/)
2. Install [Android Studio](https://developer.android.com/studio)
3. Download this repo
4. Open Terminal in repo folder
5. Run: `bash cordova/build.sh`
6. Wait 2-5 minutes
7. APK will be in: `shadowlegends-app/platforms/android/app/build/outputs/apk/debug/app-debug.apk`

✅ **Pros:** Full control, customizable, no cloud dependency
❌ **Cons:** Requires setup (~10 min)

---

### **Option 3: Manual Cordova Steps**

```bash
# 1. Install Cordova
npm install -g cordova

# 2. Create project
cordova create shadowlegends-app com.shadowlegends.game "Shadow Legends"
cd shadowlegends-app

# 3. Add Android
cordova platform add android

# 4. Copy game
cp ../index.html www/
cp ../cordova/config.xml .

# 5. Build
cordova build android --debug

# 6. Find APK
echo APK ready at: platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

---

## 📱 Install on Android Phone

### **Method A: USB Transfer (Easiest)**
1. Connect Android phone via USB
2. Enable "USB Debugging" (Settings → Developer Options)
3. Copy APK to phone
4. Open file manager on phone
5. Tap APK file
6. Allow installation
7. Done!

### **Method B: ADB Command**
```bash
adb install -r path/to/app-debug.apk
```

### **Method C: Email/Cloud**
1. Email APK to yourself
2. Open email on phone
3. Download APK
4. Tap to install

---

## 🎮 Play!

- Tap **PLAY DEMO** to start
- Use joystick to move
- Fire button (🔥) to shoot
- Build button (🧱) to place walls
- Store button (🏪) to buy upgrades

---

## ⚙️ System Requirements

**For Playing:**
- Android 5.0+ (API 19+)
- 50MB free space

**For Building:**
- 8GB RAM minimum
- 5GB disk space for Android SDK
- Java 11+

---

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| "Cordova not found" | `npm install -g cordova@latest` |
| "ANDROID_SDK_ROOT not set" | Install Android Studio, it auto-sets the path |
| "Build fails" | Run `cordova clean` then retry |
| "APK won't install" | Enable "Unknown sources" in Settings → Security |
| "Game runs slow" | Lower screen brightness, close other apps |

---

## 📊 File Sizes

- **Debug APK:** ~15-20MB
- **Release APK:** ~8-12MB (after optimization)

---

## 🔐 Publishing to Google Play Store

Once tested locally:

1. **Sign Release APK:**
   ```bash
   cordova build android --release
   # (Follow signing prompts)
   ```

2. **Create Google Play Account:**
   - Go to https://play.google.com/console
   - Pay $25 one-time registration fee
   - Fill out app details

3. **Upload APK:**
   - Upload release APK
   - Add screenshots, description, etc.
   - Submit for review (24-48 hours)

---

## 💡 Tips

- Test on actual device before publishing
- Different devices may have performance variations
- Update APK version in `cordova/config.xml` for updates
- Keep a backup of your signing key!

---

## 📞 Need Help?

- **Cordova Docs:** https://cordova.apache.org/docs
- **Android Issues:** https://developer.android.com/studio/troubleshoot
- **Game Issues:** Check this repo's issues page

---

**Enjoy Shadow Legends! 🎮⚔️**
