import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeDashboardScreen(),
    );
  }
}

/* ---------------- DASHBOARD SCREEN ---------------- */

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberLog Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: const [
            DashboardCard(
              title: 'Daily Log',
              icon: Icons.today,
              color: Colors.blue,
            ),
            DashboardCard(
              title: 'Cyber Tips',
              icon: Icons.security,
              color: Colors.green,
            ),
            DashboardCard(
              title: 'Device Security',
              icon: Icons.phonelink_lock,
              color: Colors.orange,
            ),
            DashboardCard(
              title: 'Notes',
              icon: Icons.note,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- DASHBOARD CARD ---------------- */

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1.2),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
=