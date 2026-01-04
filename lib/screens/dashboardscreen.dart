import 'package:flutter/material.dart';
import '../services/networkservice.dart';
import '../services/deviceservice.dart';
import '../services/securityfeedservice.dart';

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
    loadData();
  }

  void loadData() async {
    ip = await NetworkService.getPublicIP();
    device = await DeviceService.getDeviceInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tips = SecurityFeedService.getTips();

    return Scaffold(
      appBar: AppBar(title: const Text("CyberShield Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Device: $device"),
            const SizedBox(height: 8),
            Text("Public IP: $ip"),
            const SizedBox(height: 16),
            const Text("Security Feed",
                style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: tips.length,
                itemBuilder: (_, i) => ListTile(
                  leading: const Icon(Icons.security),
                  title: Text(tips[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
