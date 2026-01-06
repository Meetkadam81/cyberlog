# CyberLog – Flutter Portfolio Project

CyberLog is a Flutter-based portfolio project developed as part of my learning journey in **Flutter and mobile application development**. The project demonstrates core Flutter concepts, Android integration, and permission-based features while following clean project structure and best practices.

This application serves as a foundation-level project showcasing UI construction, state management, Dart logic, and Android runtime permissions.

---

## Project Overview

* Built using **Flutter**
* Runs on **Android Emulator**
* Demonstrates **core Flutter concepts**
* Uses **basic widgets and state management**
* Implements **logical condition handling in Dart**
* Includes **Android permission-based features**

---

## Application Features

### 1. Contact Information Display

Displays basic contact details using Flutter widgets:

* Name
* Phone number

### 2. Counter Feature

* Uses a Floating Action Button (FAB)
* Increments a counter value using `setState()`
* Demonstrates StatefulWidget behavior

### 3. Even / Odd Checker

An Even/Odd checker implemented using Dart conditionals.

**Functionality:**

* User enters a number
* Presses a button
* App displays whether the number is EVEN or ODD

---

## Permission-Based Features (Android)

CyberLog implements Android permission-based features following modern Android and Flutter best practices.

### Permissions Used

* Camera
* Storage (Gallery access)
* Internet

### Features Implemented

* Runtime permission request handling
* Camera access using permission validation
* Gallery image selection using storage permission
* Internet permission declared for API usage

### Technologies Used

* Flutter
* Kotlin (Android)
* `permission_handler` plugin
* `image_picker` plugin

### Compliance

* Android Runtime Permission Model
* Flutter Android Embedding v2

---

## Dart Concepts Used

### Conditionals

```dart
if (n % 2 == 0) {
  result = "$n is EVEN";
} else {
  result = "$n is ODD";
}
```

### Ternary Operator

```dart
result = n % 2 == 0 ? "$n is EVEN" : "$n is ODD";
```

### String Interpolation

```dart
"$n is EVEN"
```

This approach is cleaner and more readable than traditional string concatenation.

---

## Flutter Concepts Learned

### Widgets

* Everything in Flutter is a widget
* **StatelessWidget**: UI does not change after build
* **StatefulWidget**: UI updates dynamically based on state

Complex user interfaces are built by composing smaller widgets together.

### Hot Reload

* Allows instant UI updates without restarting the app
* Significantly improves development speed
* Available during development using JIT compilation

---

## JIT vs AOT Compilation

### JIT (Just-In-Time)

* Used during development
* Enables Hot Reload
* Compiles code while the app is running
* Slightly slower startup

### AOT (Ahead-Of-Time)

* Used in release builds
* Compiles code before execution
* Faster startup and better runtime performance
* Hot Reload not available

---

## Project Structure

```text
cyberlog/
├── lib/
├── android/
├── ios/
├── web/
├── test/
├── screenshots/
└── README.md
```

---

## Installation & Execution Steps

### 1. Install Flutter

The Flutter SDK was downloaded from the official Flutter website.

### 2. Verify Installation

```bash
flutter doctor
```

This command checks Flutter SDK, Android tools, Android Studio, and device setup.

### 3. Create the Flutter Project

```bash
flutter create cyberlog
```

### 4. Run the Application

* Open an Android emulator using Android Studio
* Run the application using:

```bash
flutter run
```

The application launches successfully on the emulator.

---

## Sample Code Snippet

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

---

## GitHub Repository

🔗 [https://github.com/Meetkadam81/cyberlog](https://github.com/Meetkadam81/cyberlog)

---

## Conclusion

This project helped me gain practical understanding of:

* Flutter project structure
* Widget-based UI development
* State management basics
* Dart conditionals and logic
* Android emulator setup
* Permission handling in Android
* Cross-platform mobile development using Flutter

CyberLog serves as a strong foundation for building more advanced Flutter applications in the future.
