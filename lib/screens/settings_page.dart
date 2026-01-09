import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const platform = MethodChannel('device/info');

  String deviceModel = 'Loading...';
  String androidVersion = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchDeviceInfo();
  }

  Future<void> fetchDeviceInfo() async {
    try {
      final model = await platform.invokeMethod<String>('getDeviceModel');
      final version =
      await platform.invokeMethod<String>('getAndroidVersion');

      setState(() {
        deviceModel = model ?? 'Unknown';
        androidVersion = version ?? 'Unknown';
      });
    } catch (e) {
      setState(() {
        deviceModel = 'Error';
        androidVersion = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Device Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: const Text('Device Model'),
            subtitle: Text(deviceModel),
          ),
          ListTile(
            leading: const Icon(Icons.system_update),
            title: const Text('Android Version'),
            subtitle: Text(androidVersion),
          ),
        ],
      ),
    );
  }
}
