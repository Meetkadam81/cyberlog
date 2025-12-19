import 'package:flutter/material.dart';
import '../models/log.dart';

class LogProvider extends ChangeNotifier {
  final List<Log> _logs = [];

  List<Log> get logs => _logs;

  void addLog(String action) {
    _logs.add(
      Log(
        action: action,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
