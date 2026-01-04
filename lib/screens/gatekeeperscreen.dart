import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../providers/lock_provider.dart';

class GatekeeperScreen extends StatelessWidget {
  const GatekeeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = LocalAuthentication();

    Future<void> authenticate() async {
      final success = await auth.authenticate(
        localizedReason: 'Unlock Vault',
      );

      if (success) {
        context.read<LockProvider>().unlock();
        Navigator.pushNamed(context, '/vault');
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Gatekeeper")),
      body: Center(
        child: ElevatedButton(
          onPressed: authenticate,
          child: const Text("Authenticate"),
        ),
      ),
    );
  }
}
