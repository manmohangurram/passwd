import 'dart:convert';

import 'package:passwd/crypto/curve/models/curve_keypair.dart';
import 'package:passwd/storage/secure_storage.dart';

class LocalUserRespository {
  LocalUserRespository(this.storage);

  SecureStorage storage;

  Future<void> insert(CurveKeyPair userKeyPair) {
    var userKey = jsonEncode(userKeyPair.toJson());
    return storage.insert("userKey", userKey);
  }

  Future<CurveKeyPair?> get() {
    return storage.get("userKey").then((userKey) {
      if (userKey == null) return null;
      return CurveKeyPair.fromJson(jsonDecode(userKey));
    });
  }
}
