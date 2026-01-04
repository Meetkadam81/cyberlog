import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  static Future<String> getPublicIP() async {
    final res = await http.get(Uri.parse('https://api.ipify.org?format=json'));
    return jsonDecode(res.body)['ip'];
  }
}
