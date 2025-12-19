import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providerss/logprovider.dart';
import 'screenss/homescreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LogProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
