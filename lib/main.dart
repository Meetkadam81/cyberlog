import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyberlog App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Even/Odd Checker'),
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
  final TextEditingController numberController = TextEditingController();
  String resultText = "";

  void checkEvenOdd() {
    int? number = int.tryParse(numberController.text);

    if (number == null) {
      setState(() {
        resultText = "Please enter a valid number.";
      });
      return;
    }

    // Even-Odd Logic using Conditionals
    if (number % 2 == 0) {
      resultText = "$number is EVEN"; // String Interpolation
    } else {
      resultText = "$number is ODD"; // String Interpolation
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter a number to check Even or Odd:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15),

            // Input
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter number here",
              ),
            ),

            const SizedBox(height: 20),

            // Button
            ElevatedButton(
              onPressed: checkEvenOdd,
              child: const Text("Check"),
            ),

            const SizedBox(height: 25),

            // Output
            Text(
              resultText,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

