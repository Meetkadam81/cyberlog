import 'package:flutter/material.dart';

class SecurityChecklistScreen extends StatelessWidget {
  const SecurityChecklistScreen({super.key});

  // MOCK VALUES (replace with real checks later)
  final bool screenLockEnabled = true;
  final bool dangerousPermissionsGranted = false;
  final bool isRootedOrEmulator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Checklist'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle("Device Security Status"),
          _securityTile(
            icon: Icons.lock,
            title: "Screen Lock Enabled",
            isSecure: screenLockEnabled,
            description:
            "Your device should have a PIN, pattern, or biometric lock enabled.",
          ),
          _securityTile(
            icon: Icons.warning_amber,
            title: "Dangerous Permissions",
            isSecure: !dangerousPermissionsGranted,
            description:
            "Apps with access to camera, microphone, or storage may pose privacy risks.",
          ),
          _securityTile(
            icon: Icons.android,
            title: "Root / Emulator Check",
            isSecure: !isRootedOrEmulator,
            description:
            "Rooted or emulated devices are more vulnerable to attacks.",
          ),
          const SizedBox(height: 24),
          _sectionTitle("Security Tips"),
          _tipCard(
              "✔ Keep your OS updated to receive the latest security patches."),
          _tipCard(
              "✔ Avoid granting unnecessary permissions to apps."),
          _tipCard(
              "✔ Do not install apps from unknown sources."),
          _tipCard(
              "✔ Use strong authentication whenever possible."),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _securityTile({
    required IconData icon,
    required String title,
    required bool isSecure,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSecure ? Colors.green : Colors.red,
          size: 30,
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: Icon(
          isSecure ? Icons.check_circle : Icons.error,
          color: isSecure ? Colors.green : Colors.red,
        ),
      ),
    );
  }

  Widget _tipCard(String text) {
    return Card(
      color: Colors.blue.shade50,
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
