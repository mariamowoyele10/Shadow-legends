# Shadow Legends APK Build - Complete Setup

## 💻 **WINDOWS BUILD (Option 2)**

### Step 1: Install Prerequisites (10 minutes)

#### 1.1 Install Node.js
- Go to https://nodejs.org/
- Download "LTS" version
- Run installer, click "Next" through all steps
- Verify installation:
  ```cmd
  node --version
  npm --version
  ```
  Should show version numbers like `v18.x.x`

#### 1.2 Install Java JDK 11
- Go to https://www.oracle.com/java/technologies/javase-jdk11-downloads.html
- Download "Windows x64 Installer"
- Run installer, follow steps
- Verify:
  ```cmd
  java -version
  ```

#### 1.3 Install Android Studio
- Go to https://developer.android.com/studio
- Download Windows installer
- Run installer, accept defaults
- **First launch:** Let it download Android SDK (~2GB)
- After install, check: Settings → System Settings → Android SDK
  - Ensure "API 19" and "API 32" are installed

### Step 2: Set Environment Variables

**Right-click Start Menu** → "System" → "Advanced system settings"

**Add these environment variables:**

1. **JAVA_HOME**
   - Variable name: `JAVA_HOME`
   - Variable value: `C:\Program Files\Java\jdk-11.0.x` (or your path)

2. **ANDROID_SDK_ROOT**
   - Variable name: `ANDROID_SDK_ROOT`
   - Variable value: `C:\Users\YourUsername\AppData\Local\Android\Sdk`

3. **ANDROID_HOME** (same as ANDROID_SDK_ROOT)
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\YourUsername\AppData\Local\Android\Sdk`

**Then:**
- Click "New" under Path
- Add: `C:\Users\YourUsername\AppData\Local\Android\Sdk\platform-tools`
- Click OK, OK, OK
- **Restart Command Prompt** (close and open new window)

### Step 3: Verify Setup

**Open Command Prompt and run:**
```cmd
node --version
java -version
adb --version
```

All should show version numbers ✅

### Step 4: Clone or Download Repo

**Option A: Using Git**
```cmd
git clone https://github.com/mariamowoyele10/Shadow-legends.git
cd Shadow-legends
```

**Option B: Manual Download**
1. Go to https://github.com/mariamowoyele10/Shadow-legends
2. Click "Code" → "Download ZIP"
3. Extract ZIP
4. Open Command Prompt in that folder

### Step 5: Run Complete Build Script

**In Command Prompt, run:**
```cmd
complete-build.bat
```

**What happens:**
- Verifies all dependencies
- Installs Cordova (if needed)
- Creates Cordova project
- Copies game files
- Cleans previous builds
- Builds APK (takes 2-5 minutes)
- Shows APK location

### Step 6: Find Your APK

**When done, your APK is here:**
```
shadowlegends-app\platforms\android\app\build\outputs\apk\debug\app-debug.apk
```

---

## 🍎 **MAC/LINUX BUILD (Option 3)**

### Step 1: Install Prerequisites (10 minutes)

#### 1.1 Install Node.js (Mac)
```bash
brew install node
```

#### 1.1 Install Node.js (Linux - Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install nodejs npm
```

Verify:
```bash
node --version
npm --version
```

#### 1.2 Install Java JDK 11 (Mac)
```bash
brew tap adoptopenjdk/openjdk
brew install adoptopenjdk11
```

#### 1.2 Install Java JDK 11 (Linux)
```bash
sudo apt-get install openjdk-11-jdk
```

Verify:
```bash
java -version
```

#### 1.3 Install Android Studio (Mac)
- Download: https://developer.android.com/studio
- Drag to Applications folder
- First launch: Let it download Android SDK
- Ensure API 19 and 32 are installed

#### 1.3 Install Android Studio (Linux)
```bash
# Download from https://developer.android.com/studio
# Or use snap:
sudo snap install android-studio --classic
```

### Step 2: Set Environment Variables

**Add to ~/.bash_profile or ~/.zshrc (Mac) or ~/.bashrc (Linux):**

```bash
export JAVA_HOME=$(/usr/libexec/java_home)  # Mac
# OR for Linux:
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk  # Mac
# OR for Linux:
export ANDROID_SDK_ROOT=$HOME/Android/Sdk

export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
```

**Then:**
```bash
source ~/.bash_profile  # Mac
# OR
source ~/.bashrc  # Linux
```

### Step 3: Verify Setup

```bash
node --version
java -version
adb --version
```

All should show version numbers ✅

### Step 4: Clone Repo

```bash
git clone https://github.com/mariamowoyele10/Shadow-legends.git
cd Shadow-legends
```

### Step 5: Run Complete Build Script

```bash
bash cordova/complete-build.sh
```

**What happens:**
- Verifies all dependencies
- Auto-detects Android SDK
- Installs Cordova (if needed)
- Creates Cordova project
- Copies game files
- Cleans previous builds
- Builds APK (takes 2-5 minutes)
- Shows APK location and installation instructions

### Step 6: Find Your APK

```bash
cd shadowlegends-app
ls platforms/android/app/build/outputs/apk/debug/
```

**Your APK is here:**
```
shadowlegends-app/platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

---

## 📱 **INSTALL ON ANDROID PHONE**

### Method A: USB Cable (Easiest)

1. **Enable USB Debugging on Phone:**
   - Settings → About Phone → Tap "Build Number" 7 times
   - Settings → Developer Options → Enable "USB Debugging"

2. **Connect via USB**

3. **Copy APK to Phone:**
   - Copy `app-debug.apk` to phone storage via USB transfer

4. **Install:**
   - Open file manager on phone
   - Navigate to APK file
   - Tap to install
   - Allow "Unknown Sources" if prompted
   - Tap "Install"
   - Done! 🎉

### Method B: ADB Command

**Windows:**
```cmd
adb install -r shadowlegends-app\platforms\android\app\build\outputs\apk\debug\app-debug.apk
```

**Mac/Linux:**
```bash
adb install -r shadowlegends-app/platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

### Method C: Email or Cloud

1. Email the APK to yourself
2. Open email on phone
3. Download APK
4. Tap to install

---

## 🎮 **PLAY THE GAME**

1. Find "Shadow Legends" icon on home screen
2. Tap to launch
3. Tap **PLAY DEMO**
4. Use joystick to move
5. Fire button (🔥) to shoot
6. Build button (🧱) to place walls
7. Store button (🏪) to buy upgrades
8. Defeat all 12 enemies to win!

---

## 🔧 **TROUBLESHOOTING**

### "Command not found: cordova"
**Windows:**
```cmd
npm install -g cordova@latest
```

**Mac/Linux:**
```bash
sudo npm install -g cordova@latest
```

### "ANDROID_SDK_ROOT not set"
- Verify environment variables are set (Step 2)
- Restart Command Prompt/Terminal after setting variables
- Check path is correct in your profile

### "Build fails with error"
```bash
# Clean and retry
cd shadowlegends-app
cordova clean
cordova build android --debug
```

### "APK won't install"
- Enable "Unknown Sources" in Settings → Security
- Try: `adb uninstall com.shadowlegends.game` then reinstall
- Ensure Android 5.0+ (API 19+)

### "Game runs slow"
- Close other apps
- Lower screen brightness
- Disable animations in Settings
- Try on a newer device

---

## ✅ **FINAL CHECKLIST**

- [ ] Node.js installed
- [ ] Java JDK 11 installed
- [ ] Android Studio installed with SDK
- [ ] Environment variables set
- [ ] Repo cloned/downloaded
- [ ] `complete-build.bat` or `complete-build.sh` ran successfully
- [ ] APK file exists
- [ ] APK installed on phone
- [ ] Game launches and runs
- [ ] All controls work (joystick, fire, build, store)
- [ ] Game plays without crashing

**All checked? You're done! 🎮⚔️**

---

## 📞 **NEED HELP?**

- **Cordova Docs:** https://cordova.apache.org/docs
- **Android Issues:** https://developer.android.com/studio/troubleshoot
- **Game Issues:** Open issue on GitHub
- **Java Issues:** https://www.oracle.com/java/

**Enjoy Shadow Legends! 🏆**
