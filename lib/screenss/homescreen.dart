import 'package:flutter/material.dart';
import '../widgets/cyber_tip_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CyberLog Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            CyberTipCard(),
          ],
        ),
      ),
    );
  }
}
