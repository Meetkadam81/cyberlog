import 'package:hive/hive.dart';
import 'package:encrypt/encrypt.dart';

class VaultService {
  static const _boxName = 'vaultBox';
  static const _keyName = 'secret';

  final _key = Key.fromUtf8('1234567890123456'); // TODO: replace later
  final _iv = IV.fromLength(16);

  Future<void> saveSecret(String data) async {
    final box = await Hive.openBox(_boxName);
    final encrypted = Encrypter(AES(_key)).encrypt(data, iv: _iv);
    await box.put(_keyName, encrypted.base64);
  }

  Future<String> readSecret() async {
    final box = await Hive.openBox(_boxName);
    final encryptedData = box.get(_keyName);
    if (encryptedData == null) return '';
    return Encrypter(AES(_key)).decrypt64(encryptedData, iv: _iv);
  }
}
