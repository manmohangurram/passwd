import 'dart:ffi';

import 'package:passwd/features/record/application/record_crypto.dart';
import 'package:passwd/features/record/data/local_record_repository.dart';
import 'package:passwd/features/record/domain/cipher_record.dart';
import 'package:passwd/features/record/domain/record.dart';
import 'package:realm/realm.dart';

class RecordService {
  RecordService(
      this.realm, List<int> sharedKey, DynamicLibrary dynamicLibrary) {
    recordCrypto = RecordCrypto(sharedKey, dynamicLibrary);
  }

  final Realm realm;
  late RecordCrypto recordCrypto;

  Future<CipherRecord> insert(Record record) {
    return recordCrypto.encrypt(record).then((cipherRecord) {
      LocalRecordRespository(realm).insert(cipherRecord);
      return cipherRecord;
    });
  }

  Future<List<Record>> getAll() async {
    List<Future<Record>> futureRecords = [];
    for (CipherRecord record
        in LocalRecordRespository(realm).get(DateTime.now())) {
      futureRecords.add(recordCrypto.decrypt(record));
    }
    return Future.wait(futureRecords);
  }
}
