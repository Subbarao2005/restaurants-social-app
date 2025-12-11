# Complete Setup and Launch Guide
# Restaurants Social Mobile App

This guide will help you set up and launch the Restaurants Social Mobile App on Android or iOS devices/emulators.

## Prerequisites

Make sure you have the following installed on your system:

### Required Software

1. **Flutter SDK** (>=3.0.0)
   - Download from: https://flutter.dev/docs/get-started/install
   - Add Flutter to your PATH

2. **Dart SDK**
   - Usually comes with Flutter, but ensure it's installed
   - Verify: `dart --version`

3. **Git**
   - Download from: https://git-scm.com/
   - Verify: `git --version`

### For Android Development

1. **Android Studio**
   - Download from: https://developer.android.com/studio
   - Install Android SDK
   - Install Android Emulator

2. **Android SDK Tools**
   - Minimum API Level: 21 (Android 5.0)
   - Target API Level: 33+

3. **Java Development Kit (JDK)**
   - JDK 11 or higher
   - Set `JAVA_HOME` environment variable

### For iOS Development (macOS only)

1. **Xcode**
   - Download from App Store or https://developer.apple.com/download/
   - Command Line Tools: `xcode-select --install`

2. **CocoaPods**
   - Install: `sudo gem install cocoapods`

## Step 1: Clone the Repository

```bash
git clone https://github.com/Subbarao2005/restaurants-social-app.git
cd restaurants-social-app
```

## Step 2: Install Flutter Dependencies

```bash
flutter clean
flutter pub get
```

## Step 3: Setup Firebase

### Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a new project"
3. Enter project name: `restaurants-social-app`
4. Enable Google Analytics (optional)
5. Create the project

### Enable Firebase Services

1. **Authentication**
   - Go to Authentication > Sign-in method
   - Enable Email/Password authentication

2. **Realtime Database**
   - Go to Realtime Database > Create Database
   - Select region (e.g., us-central1)
   - Start in Test Mode (for development)
   - Create database

### Configure Android

1. Add Android App to Firebase Project:
   - Project Settings > Add App
   - Select Android
   - Enter package name: `com.example.restaurants_social_app`
   - Download `google-services.json`
   - Place in: `android/app/google-services.json`

2. Update Android configuration:
   ```bash
   # Edit android/app/build.gradle
   # Ensure classpath includes:
   classpath 'com.google.gms:google-services:4.3.15'
   ```

### Configure iOS

1. Add iOS App to Firebase Project:
   - Project Settings > Add App
   - Select iOS
   - Enter bundle ID: `com.example.restaurantsSocialApp`
   - Download `GoogleService-Info.plist`
   - Open iOS project in Xcode
   - Drag `GoogleService-Info.plist` to Xcode (check "Copy if needed")

2. Update iOS deployment target:
   ```bash
   # Edit ios/Podfile
   # Ensure platform :ios, '11.0' or higher
   ```

## Step 4: Configure Google Maps API

### Get Google Maps API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project
3. Enable APIs:
   - Google Maps Platform
   - Maps SDK for Android
   - Maps SDK for iOS
   - Places API

4. Create API Key:
   - APIs & Services > Credentials
   - Create Credentials > API Key
   - Restrict key to Android and iOS

### Configure Android

1. Edit `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <application>
     <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY_HERE" />
   </application>
   ```

2. Add location permissions:
   ```xml
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
   ```

### Configure iOS

1. Edit `ios/Runner/Info.plist`:
   ```xml
   <key>com.google.ios.API_KEY</key>
   <string>YOUR_API_KEY_HERE</string>
   ```

2. Add location permissions:
   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>This app needs your location to show nearby restaurants</string>
   <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
   <string>This app needs your location to show nearby restaurants</string>
   ```

## Step 5: Update App Configuration

### Update Android Package Name (Optional)

If you want to change from `com.example.restaurants_social_app`:

```bash
flutter pub run change_app_package_name:main com.yourname.restaurantapp
```

## Step 6: Verify Setup

```bash
# Check doctor for any issues
flutter doctor -v

# Check device/emulator connection
flutter devices
```

## Step 7: Launch the App

### Option A: Launch on Android Emulator

```bash
# Start emulator (from Android Studio or command line)
emulator -avd Pixel_3_API_30 &

# Wait for emulator to boot, then run:
flutter run
```

### Option B: Launch on Android Device

```bash
# Enable USB Debugging on device
# Connect device via USB cable

# Verify device is connected:
flutter devices

# Run app:
flutter run
```

### Option C: Launch on iOS Simulator (macOS)

```bash
# Open iOS project in Xcode (optional):
open ios/Runner.xcworkspace

# Run on simulator:
flutter run -d "iPhone 14 Pro"

# Or run on default simulator:
flutter run
```

### Option D: Launch on iOS Device (macOS)

```bash
# Connect device and verify:
flutter devices

# Update provisioning profiles in Xcode if needed
# Then run:
flutter run
```

## Step 8: Using the App

### Initial Setup

1. **Sign Up / Sign In**
   - Create account with email and password
   - Or sign in with existing account

2. **Grant Permissions**
   - Allow location access when prompted
   - Allow contacts access for friend management

### Using Restaurants Tab

1. Navigate to "Restaurants" tab
2. See map with your current location
3. View nearby restaurants (markers on map)
4. Tap a restaurant marker to see details
5. Click "Go Here" to select restaurant
6. Selection expires in 12 hours

### Using Friends Tab

1. Navigate to "Friends" tab
2. Click "Add Friend" button
3. Select contacts to add as friends
4. View friends' restaurant selections
5. See real-time updates of friends' choices

## Troubleshooting

### Location not Detected

**Problem:** App doesn't show location or restaurants

**Solutions:**
1. Check location permissions in app settings
2. Enable GPS on device/emulator
3. Restart app
4. Verify Geolocator package initialization

### Firebase Connection Failed

**Problem:** Authentication or database errors

**Solutions:**
1. Verify Firebase configuration files are in correct locations
2. Check internet connectivity
3. Verify Firebase project is active
4. Check Firebase security rules (set to Test Mode for development)

### Google Maps Not Displaying

**Problem:** Map shows blank white screen

**Solutions:**
1. Verify API key is correctly configured
2. Check API key has Maps and Places enabled
3. Verify API key restrictions are set correctly
4. Restart app and check error logs: `flutter logs`

### Android Build Errors

**Problem:** Build fails with gradle errors

**Solutions:**
```bash
# Clean and rebuild:
flutter clean
flutter pub get
flutter run --release

# Or with verbose output:
flutter run -v
```

### iOS Pod Installation Issues

**Problem:** Pod installation fails

**Solutions:**
```bash
cd ios
pod repo update
pod install --repo-update
cd ..
flutter run
```

## Development Mode

### Hot Reload

While app is running:
- Press `r` to hot reload code changes
- Press `R` to hot restart

### Debug Logging

Add print statements and use:
```bash
flutter logs
```

### Profile Build

For better performance testing:
```bash
flutter run --profile
```

### Release Build

For production-like testing:
```bash
flutter run --release
```

## Next Steps

1. **Customize App**
   - Update colors and branding
   - Add custom icons and assets
   - Modify UI layout

2. **Add Features**
   - Restaurant reviews
   - Photo uploads
   - Real-time chat
   - Notifications

3. **Testing**
   - Write unit tests
   - Write widget tests
   - Test on multiple devices

4. **Deployment**
   - Build release APK for Android
   - Build IPA for iOS
   - Publish to Play Store and App Store

## Useful Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Google Maps API Docs](https://developers.google.com/maps/documentation)
- [Dart Language Guide](https://dart.dev/guides)

## Support

For issues or questions:
1. Check the [README.md](README.md) for project overview
2. Review error logs with `flutter logs`
3. Check Firebase console for backend issues
4. Open an issue on GitHub

## Success!

Once you complete all steps, your Restaurants Social Mobile App should be running on your device/emulator. Enjoy discovering restaurants with your friends!
