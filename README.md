# cyberlog – Flutter Portfolio Project

This project is part of my mobile development learning journey. It demonstrates how to set up Flutter, run an app on an emulator, understand widgets, and manage a cross-platform project. The app displays simple contact information using basic Flutter widgets.

What I Learned

## • Native vs Cross-Platform Development

Native apps are written for one platform (Android in Kotlin/Java and iOS in Swift).
Flutter is cross-platform and allows one codebase to run on Android, iOS, Web, Windows, macOS, and Linux.

## • Hot Reload

Hot Reload lets me instantly see code changes without restarting the whole app.

## • Widgets

Flutter uses widgets for everything.
StatelessWidget does not change.
StatefulWidget can update dynamically.
Combining widgets builds the entire UI.

## Steps I Followed to Install and Run the App

### • Installed Flutter

I downloaded Flutter from the official installation guide.

### • Verified Installation

I ran the command:
flutter doctor
This checked the Flutter SDK, Android tools, Android Studio, and device setup.

### • Created the Flutter Project

I created the project using:
flutter create cyberlog

### • Ran the App

I opened an emulator using Android Studio.
I ran the application using:
flutter run
The app launched successfully.

Screenshots

• App running on the emulator
"C:\Users\MEET\OneDrive\Pictures\Screenshots\Screenshot 2025-12-04 104831.png"

• IDE with code and emulator view
"C:\Users\MEET\OneDrive\Pictures\Screenshots\Screenshot 2025-12-04 105031.png"

• flutter doctor output
"C:\Users\MEET\OneDrive\Pictures\Screenshots\Screenshot 2025-12-04 105137.png"

## Project Structure

cyberlog
• lib
• android
• ios
• web
• test
• README.md
• screenshots

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
children: <Widget>[
const Text(
"Name: Meet\nPhone Number: +919999999999",
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 30),
const Text(
'You have pushed the button this many times:',
),
Text(
'$_counter',
style: Theme.of(context).textTheme.headlineMedium,
),
],
),
),
floatingActionButton: FloatingActionButton(
onPressed: _incrementCounter,
tooltip: 'Increment',
child: const Icon(Icons.add),
),
);
}
}


## GitHub Repository Link

https://github.com/Meetkadam81/cyberlog

Completion

This project helped me understand the basics of Flutter development, widgets, project organization, emulator setup, and cross-platform app creation.

• Integrated Even/Odd Checker

I added the Even/Odd Checker App into my existing Flutter project.
It uses a TextField, a button, and a conditional check to display whether a number is even or odd.

"C:\Users\MEET\OneDrive\Pictures\Screenshots\Screenshot 2025-12-08 091631.png"

JIT vs AOT Compilation 
• JIT (Just-In-Time)

Used during development.

Compiles code while the app is running.

Enables Hot Reload, making development fast.

Slower startup compared to AOT.

• AOT (Ahead-Of-Time)

Used when building a release version.

Code is compiled before the app runs.

Leads to faster startup and better performance.

No Hot Reload.

How I Used Dart Conditionals for Even/Odd Check

I used the % modulus operator to check the remainder:

if (n % 2 == 0) {
  result = "$n is EVEN";
} else {
  result = "$n is ODD";
}


This simple conditional lets me decide which output to show on the screen.

How I Used String Interpolation

String interpolation lets me insert variables directly inside strings:

"$n is EVEN"


Instead of writing:

n.toString() + " is EVEN"


This makes the code cleaner and easier to read.

Final Code Snippet Added into Project
result = n % 2 == 0 ? "$n is EVEN" : "$n is ODD";
