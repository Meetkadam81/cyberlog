import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../providers/lock_provider.dart';

class GatekeeperScreen extends StatefulWidget {
  const GatekeeperScreen({super.key});

  @override
  State<GatekeeperScreen> createState() => _GatekeeperScreenState();
}

class _GatekeeperScreenState extends State<GatekeeperScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final LocalAuthentication _auth = LocalAuthentication();

  Future<void> authenticate() async {
    // PASSWORD CHECK
    if (_passwordController.text.trim() != "1234") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Wrong password")),
      );
      return;
    }

    try {
      final bool success = await _auth.authenticate(
        localizedReason: 'Authenticate to access Vault',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Authentication failed")),
        );
        return;
      }

      // UNLOCK PROVIDER
      context.read<LockProvider>().unlock();

      // NAVIGATE
      Navigator.pushReplacementNamed(context, '/vault');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Auth error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gatekeeper")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 60),
            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Enter Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: authenticate,
              child: const Text("Verify & Unlock"),
            ),
          ],
        ),
      ),
    );
  }
}
