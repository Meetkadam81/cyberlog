cyberlog – Flutter Portfolio Project

This project is part of my Flutter and mobile application development learning journey. It demonstrates the fundamentals of Flutter, including project setup, widget usage, emulator execution, and cross-platform development.

The app displays simple contact information, includes a counter feature, and integrates an Even/Odd Checker using Dart conditionals.

Project Overview

Built using Flutter

Runs on Android emulator

Demonstrates core Flutter concepts

Uses basic widgets and state management

Includes logical condition handling in Dart

What I Learned
Native vs Cross-Platform Development

Native applications are developed separately for each platform:

Android: Java / Kotlin

iOS: Swift

Flutter enables cross-platform development, allowing a single codebase to run on:

Android

iOS

Web

Windows

macOS

Linux

Hot Reload

Hot Reload allows instant UI updates without restarting the entire app, making development faster and more efficient.

Widgets

Everything in Flutter is a widget.

StatelessWidget: UI does not change once built

StatefulWidget: UI updates dynamically based on state

By combining widgets, complex user interfaces can be built easily.

Installation & Execution Steps
1. Install Flutter

Flutter SDK was downloaded from the official Flutter website.

2. Verify Installation
   flutter doctor


This command checks Flutter SDK, Android tools, Android Studio, and device setup.

3. Create the Flutter Project
   flutter create cyberlog

4. Run the Application

Open an Android emulator using Android Studio

Run the app using:

flutter run


The application launches successfully on the emulator.

Application Features
Contact Information Display

The app displays basic contact details using Flutter widgets:

Name

Phone number

Counter Feature

A floating action button increments a counter value using setState().

Even / Odd Checker

An Even/Odd Checker feature was added to the project.

Functionality:

User enters a number

Presses a button

App displays whether the number is EVEN or ODD

Dart Concepts Used
Conditionals
if (n % 2 == 0) {
result = "$n is EVEN";
} else {
result = "$n is ODD";
}

Ternary Operator
result = n % 2 == 0 ? "$n is EVEN" : "$n is ODD";

String Interpolation
"$n is EVEN"


This is cleaner and more readable than:

n.toString() + " is EVEN";

JIT vs AOT Compilation
JIT (Just-In-Time)

Used during development

Enables Hot Reload

Compiles code while app is running

Slightly slower startup

AOT (Ahead-Of-Time)

Used in release builds

Compiles code before execution

Faster startup and better performance

Hot Reload not available

Project Structure
cyberlog/
├── lib/
├── android/
├── ios/
├── web/
├── test/
├── screenshots/
└── README.md

Main Code Example
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

class MyHomePage extends StatefulWidget {
const MyHomePage({super.key, required this.title});
final String title;

@override
State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int _counter = 0;

void _incrementCounter() {
setState(() {
_counter++;
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
backgroundColor: Theme.of(context).colorScheme.inversePrimary,
title: Text(widget.title),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
"Name: Meet\nPhone Number: +91XXXXXXXXXX",
textAlign: TextAlign.center,
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
const SizedBox(height: 30),
const Text('You have pushed the button this many times:'),
Text(
'$_counter',
style: Theme.of(context).textTheme.headlineMedium,
),
],
),
),
floatingActionButton: FloatingActionButton(
onPressed: _incrementCounter,
child: const Icon(Icons.add),
),
);
}
}

GitHub Repository

https://github.com/Meetkadam81/cyberlog

Conclusion

This project helped me understand:

Flutter project structure

Widgets and UI building

Emulator setup

Dart conditionals

State management basics

Cross-platform mobile development

It serves as a strong foundation for more advanced Flutter applications.