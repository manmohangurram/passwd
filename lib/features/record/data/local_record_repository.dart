import 'package:passwd/features/record/domain/cipher_record.dart';
import 'package:realm/realm.dart';

class LocalRecordRespository {
  LocalRecordRespository(this.realm);

  Realm realm;

  void insert(CipherRecord record) {
    realm.write(() {
      realm.add(record);
    });
  }

  List<CipherRecord> get(DateTime createdOn) {
    return realm.query<CipherRecord>(
        "createdOn < \$0 SORT(createdOn DESC) LIMIT(5)", [createdOn]).toList();
  }
}
