import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class Log {
  String action;
  DateTime timestamp;
  String status;

  Log(this.action, this.timestamp, this.status);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogScreen(),
    );
  }
}

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Log> logs = [
      Log("User Logged In", DateTime.now(), "Success"),
      Log("Profile Updated", DateTime.now().subtract(const Duration(minutes: 10)), "Success"),
      Log("Password Attempt Failed", DateTime.now().subtract(const Duration(hours: 1)), "Failed"),
      Log("Data Synced", DateTime.now().subtract(const Duration(days: 1)), "Success"),
    ];


    return Scaffold(
      appBar: AppBar(title: const Text("Activity Logs")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: logs.map((log) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "${log.action} • ${log.timestamp.toString()} • ${log.status}",
                style: const TextStyle(fontSize: 16),
              ),
            );
          }).toList(), // Convert map to list
        ),
      ),
    );
  }
}
