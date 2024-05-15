import 'dart:convert';

import 'package:sodium/sodium.dart';
import 'package:passwd/crypto/cipher/libsodium/libsodium_cipher_crypto.dart';
import 'package:passwd/crypto/cipher/models/cipher_key.dart';
import 'package:passwd/features/record/domain/cipher_record.dart';
import 'package:passwd/features/record/domain/metadata.dart';
import 'package:passwd/features/record/domain/record.dart';

class RecordCrypto {
  RecordCrypto(this.sharedKey, Sodium sodium) {
    cipherCrypto = LibSodiumCipherCrypto(sodium);
  }

  late List<int> sharedKey;
  late LibSodiumCipherCrypto cipherCrypto;

  Future<CipherRecord> encrypt(Record record) {
    return _createKeyNonce(record.id).then((keyNonce) {
      var data = utf8.encode(jsonEncode(record.metadata.toJson()));
      return cipherCrypto.encrypt(data, keyNonce).then((cipher) {
        return CipherRecord(
            record.id, cipher, record.createdOn, record.modifiedOn,
            linkedTags: record.linkedTags);
      });
    });
  }

  Future<Record> decrypt(CipherRecord record) {
    return _createKeyNonce(record.id).then((keyNonce) {
      return cipherCrypto.decrypt(record.data, keyNonce).then((metadataBytes) {
        var metadata = Metadata.fromJson(
            jsonDecode(utf8.decode(metadataBytes)) as Map<String, dynamic>);
        return Record(record.id, metadata, record.createdOn, record.modifiedOn,
            record.linkedTags);
      });
    });
  }

  Future<CipherKeyNonce> _createKeyNonce(String recordId) {
    var recordIdBytes = utf8.encode(recordId).toList();
    recordIdBytes.addAll(sharedKey);
    return cipherCrypto.generateCipherNonce(recordIdBytes);
  }
}
