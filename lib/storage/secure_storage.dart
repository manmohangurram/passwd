import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:passwd/storage/storage.dart';

class SecureStorage implements Storage {
  final storage = const FlutterSecureStorage();

  @override
  Future<String?> get(String key) {
    return storage.read(key: key);
  }

  @override
  Future<void> insert(String key, String value) {
    return storage.write(key: key, value: value);
  }
}
