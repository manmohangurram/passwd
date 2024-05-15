import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/state_manager.dart';
import 'package:sodium/sodium.dart';
import 'package:passwd/crypto/curve/libsodium/libsodium_curve_crypto.dart';
import 'package:passwd/crypto/curve/models/curve_keypair.dart';
import 'package:passwd/features/record/application/record_service.dart';
import 'package:passwd/features/record/domain/metadata.dart';
import 'package:passwd/features/record/domain/record.dart';
import 'package:realm/realm.dart';
import 'package:uuid/uuid.dart' as Uuid;

class RecordViewController extends GetxController {
  RecordViewController(this.realm);

  late Realm realm;
  final storage = const FlutterSecureStorage();
  final sodiumInit =
      SodiumInit.init2(() => DynamicLibrary.open("libsodium.so"));

  late RecordService recordService;

  Future<Record> insertData() {
    return generateSharedKey().then((key) {
      return sodiumInit.then((sodium) {
        recordService = RecordService(realm, key, sodium);
        return insertRandomData();
      });
    });
  }

  Future<List<int>> generateSharedKey() {
    return storage.read(key: "userKey").then((userKey) {
      if (userKey == null) {
        return sodiumInit.then((sodium) {
          var curveCrypto = LibSodiumCurveCrypto(sodium);
          var userKeyPair = curveCrypto.generateNewKeyPair();
          var deviceKeyPair = curveCrypto.generateNewKeyPair();

          return Future.wait([userKeyPair, deviceKeyPair]).then((keyPairs) {
            var sharedKey = curveCrypto.generateSharedKey(
                keyPairs[0], keyPairs[1].publicKey);
            storage.write(
                key: "userKey", value: jsonEncode(keyPairs[0].toJson()));
            storage.write(
                key: "deviceKey", value: jsonEncode(keyPairs[1].toJson()));
            return sharedKey;
          });
        });
      } else {
        return storage.read(key: "deviceKey").then((deviceKey) {
          return sodiumInit.then((sodium) {
            var curveCrypto = LibSodiumCurveCrypto(sodium);

            var userKeyPair = CurveKeyPair.fromJson(jsonDecode(userKey));
            var deviceKeyPair = CurveKeyPair.fromJson(jsonDecode(deviceKey!));

            return curveCrypto.generateSharedKey(
                userKeyPair, deviceKeyPair.publicKey);
          });
        });
      }
    });
  }

  Future<Record> insertRandomData() {
    var uuid = const Uuid.Uuid();
    var id = uuid.v7().replaceAll("-", "");

    var metadata = Metadata("google", "www.google.com", "username", "password");
    var record = Record(id, metadata, DateTime.now(), DateTime.now(), []);

    return recordService.insert(record).then((_) => record);
  }

  Future<List<Record>> getRecords() {
    return recordService.getAll();
  }
}
