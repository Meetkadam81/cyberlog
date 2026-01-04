import 'package:hive/hive.dart';
import 'package:encrypt/encrypt.dart';

class VaultService {
  final _key = Key.fromUtf8('1234567890123456');
  final _iv = IV.fromLength(16);

  Future<void> saveSecret(String data) async {
    final box = await Hive.openBox('vaultBox');
    final encrypter = Encrypter(AES(_key));
    final encrypted = encrypter.encrypt(data, iv: _iv);
    await box.put('secret', encrypted.base64);
  }

  Future<String> readSecret() async {
    final box = await Hive.openBox('vaultBox');
    final encryptedData = box.get('secret');
    if (encryptedData == null) return '';
    final encrypter = Encrypter(AES(_key));
    return encrypter.decrypt64(encryptedData, iv: _iv);
  }
}
