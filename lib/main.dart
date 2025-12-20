import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiExample(),
    );
  }
}

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  String age = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchAge();
  }

  Future<void> fetchAge() async {
    final url = Uri.parse("https://api.agify.io/?name=meet");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        age = data['age'].toString();
      });
    } else {
      setState(() {
        age = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Public API Example"),
      ),
      body: Center(
        child: Text(
          "Predicted Age: $age",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
