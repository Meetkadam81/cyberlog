import 'package:flutter/material.dart';
import '../models/log.dart';
import '../services/log_storage.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({super.key});

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  List<Log> logs = [];

  @override
  void initState() {
    super.initState();
    loadLogs();
  }

  Future<void> loadLogs() async {
    final storedLogs = await LogStorage.loadLogs();
    setState(() {
      logs = storedLogs;
    });
  }

  Future<void> addLog() async {
    final newLog = Log(
      action: 'Login Attempt',
      timestamp: DateTime.now().toString(),
      status: 'Success',
    );

    logs.add(newLog);
    await LogStorage.saveLogs(logs);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cyber Logs')),
      floatingActionButton: FloatingActionButton(
        onPressed: addLog,
        child: const Icon(Icons.add),
      ),
      body: logs.isEmpty
          ? const Center(child: Text('No logs yet'))
          : ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          final log = logs[index];
          return ListTile(
            title: Text(log.action),
            subtitle: Text(log.timestamp),
            trailing: Text(log.status),
          );
        },
      ),
    );
  }
}
