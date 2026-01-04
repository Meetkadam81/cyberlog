import 'package:flutter/material.dart';
import 'screens/dashboardscreen.dart';
import 'screens/gatekeeperscreen.dart';
import 'screens/vaultscreen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (_) => const DashboardScreen(),
  '/gate': (_) => const GatekeeperScreen(),
  '/vault': (_) => const VaultScreen(),
};
