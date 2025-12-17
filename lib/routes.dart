import 'package:flutter/material.dart';
import 'screenA.dart';
import 'screenb.dart';
import 'screenc.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const ScreenA(),
    '/screenB': (context) => const ScreenB(),
    '/screenC': (context) => const ScreenC(),
  };
}
