import 'package:device_info_plus/device_info_plus.dart';

class DeviceService {
  static Future<String> getDeviceInfo() async {
    final info = DeviceInfoPlugin();
    final android = await info.androidInfo;
    return "${android.model} (Android ${android.version.release})";
  }
}
