import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DeviceModelScreen(),
    );
  }
}

class DeviceModelScreen extends StatefulWidget {
  const DeviceModelScreen({super.key});

  @override
  State<DeviceModelScreen> createState() => _DeviceModelScreenState();
}

class _DeviceModelScreenState extends State<DeviceModelScreen> {
  static const platform = MethodChannel('device/info');
  String deviceModel = 'Unknown';

  @override
  void initState() {
    super.initState();
    fetchDeviceModel();
  }

  Future<void> fetchDeviceModel() async {
    try {
      final String result =
      await platform.invokeMethod('getDeviceModel');
      setState(() {
        deviceModel = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        deviceModel = "Failed to get device model: ${e.message}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Model')),
      body: Center(
        child: Text(
          deviceModel,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
