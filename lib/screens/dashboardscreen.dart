import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String ip = 'Loading...';
  String device = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchIP();
    fetchDevice();
  }

  Future<void> fetchIP() async {
    try {
      final res =
      await http.get(Uri.parse('https://api.ipify.org?format=json'));
      final data = jsonDecode(res.body);
      setState(() => ip = data['ip']);
    } catch (e) {
      setState(() => ip = 'Failed to fetch IP');
    }
  }

  Future<void> fetchDevice() async {
    final info = await DeviceInfoPlugin().androidInfo;
    setState(() {
      device = '${info.model} | Android ${info.version.release}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🛡 Security Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📱 Device: $device",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("🌐 Public IP: $ip",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            const Text(
              "🔒 Security Tips",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(title: Text("Use strong, unique passwords")),
                  ListTile(title: Text("Enable 2FA on all accounts")),
                  ListTile(title: Text("Avoid public Wi-Fi networks")),
                  ListTile(title: Text("Keep your OS up to date")),
                  ListTile(title: Text("Lock sensitive apps")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
