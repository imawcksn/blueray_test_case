# blueray_test_project

# Project Setup Guide

Welcome to the project! Follow these simple steps to set up your project after cloning it.

## Install Flutter
https://docs.flutter.dev/get-started/install

## Project Setup Steps

### 1. Install FVM (Only once)
If you don't have FVM installed on your device, you can install it by running:

```bash
dart pub global activate fvm
```

### 2. Navigate to Project Folder

```bash
cd path/to/cloned/project
```

### 3. Install the Project's Flutter Version

```bash
fvm install
```

### 4. Use the Project-Specific Version

```bash
fvm use
```

### 5. Check if there's something missing

```bash
flutter doctor -v
```

Flutter version should be Flutter version 3.24.5 on channel stable at path\to\fvm\versions\3.24.5

If it's correct, you should be able to run commands without fvm, because it will be integrated

If it isnt, try this and check again.

```bash
fvm flutter doctor -v
```

If Flutter version 3.24.4 on channel stable at path\to\fvm\versions\3.24.4 only shows up at fvm flutter doctor -v, that means you should run every flutter command with fvm.

### 6. Install Dependencies (Equivalent of Composer Install)

```bash
fvm flutter pub get
```

### 7. Env
Create a .env file and fill its contents

### 8. Run the App
Open an android emulator and then

```bash
fvm flutter run
```

# Build the App

```bash
fvm flutter build apk --release --obfuscate --split-debug-info=build/debug-info
```

App will be in build\flutter-apk\

## Warning
### Do not run flutter pub upgrade / flutter upgrade to avoid dependency version conflicts, unless you need the app to run on newer android versions

