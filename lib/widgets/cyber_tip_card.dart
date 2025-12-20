import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CyberTipCard extends StatefulWidget {
  const CyberTipCard({super.key});

  @override
  State<CyberTipCard> createState() => _CyberTipCardState();
}

class _CyberTipCardState extends State<CyberTipCard> {
  String tip = "Loading cyber tip...";

  @override
  void initState() {
    super.initState();
    fetchCyberTip();
  }

  Future<void> fetchCyberTip() async {
    final url = Uri.parse("https://api.adviceslip.com/advice");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        tip = data['slip']['advice'];
      });
    } else {
      setState(() {
        tip = "Failed to load tip";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cyber Tip of the Day",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              tip,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
