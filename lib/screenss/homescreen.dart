import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providerss/logprovider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logProvider = Provider.of<LogProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberLog'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              logProvider.addLog('User logged in');
            },
            child: const Text('Add Log'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: logProvider.logs.length,
              itemBuilder: (context, index) {
                final log = logProvider.logs[index];
                return ListTile(
                  title: Text(log.action),
                  subtitle: Text(log.timestamp.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
