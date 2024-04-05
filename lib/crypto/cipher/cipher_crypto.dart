import 'dart:async';
import 'dart:typed_data';

import 'package:passwd/crypto/cipher/models/cipher_key.dart';

abstract class CipherCrypto {
  Future<CipherKeyNonce> generateCipherNonce(List<int> bytes);

  Future<Uint8List> encrypt(List<int> message, CipherKeyNonce keyNonce);

  Future<List<int>> decrypt(List<int> cipher, CipherKeyNonce keyNonce);
}
