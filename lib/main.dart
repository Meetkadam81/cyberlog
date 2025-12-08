import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Even or Odd Checker"),
        ),
        body: const EvenOddApp(),
      ),
    );
  }
}

class EvenOddApp extends StatefulWidget {
  const EvenOddApp({super.key});

  @override
  State<EvenOddApp> createState() => _EvenOddAppState();
}

class _EvenOddAppState extends State<EvenOddApp> {
  final TextEditingController numberController = TextEditingController();
  String resultMessage = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: numberController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Enter a number",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              String input = numberController.text;
              int number = int.parse(input);

              if (number % 2 == 0) {
                resultMessage = "The number $number is Even.";
              } else {
                resultMessage = "The number $number is Odd.";
              }

              setState(() {});
            },
            child: const Text("Check"),
          ),

          const SizedBox(height: 20),

          Text(
            resultMessage,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
