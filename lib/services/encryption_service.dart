import 'package:encrypt/encrypt.dart';

class EncryptionService {
  // 32 chars key (AES-256)
  static final Key _key =
  Key.fromUtf8('12345678901234567890123456789012');

  static final IV _iv = IV.fromLength(16);
  static final Encrypter _encrypter = Encrypter(AES(_key));

  static String encryptText(String plainText) {
    final encrypted = _encrypter.encrypt(plainText, iv: _iv);
    return encrypted.base64;
  }

  static String decryptText(String encryptedText) {
    return _encrypter.decrypt64(encryptedText, iv: _iv);
  }
}
