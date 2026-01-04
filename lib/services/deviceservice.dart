import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/log.dart';

class LogStorage {
  static const String _key = 'user_logs';

  static Future<void> saveLogs(List<Log> logs) async {
    final prefs = await SharedPreferences.getInstance();
    final logList =
    logs.map((log) => jsonEncode(log.toMap())).toList();
    await prefs.setStringList(_key, logList);
  }

  static Future<List<Log>> loadLogs() async {
    final prefs = await SharedPreferences.getInstance();
    final logList = prefs.getStringList(_key) ?? [];

    return logList
        .map((log) => Log.fromMap(jsonDecode(log)))
        .toList();
  }
}
