import 'package:flutter/material.dart';

class LockProvider extends ChangeNotifier {
  bool unlocked = false;

  void unlock() {
    unlocked = true;
    notifyListeners();
  }

  void lock() {
    unlocked = false;
    notifyListeners();
  }
}
