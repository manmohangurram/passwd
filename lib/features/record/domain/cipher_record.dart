import 'dart:typed_data';

import 'package:realm/realm.dart';

part 'cipher_record.g.dart';

@RealmModel()
class _CipherRecord {
  @PrimaryKey()
  @MapTo("_id")
  late String id;
  late Uint8List data;
  late DateTime createdOn;
  late DateTime modifiedOn;
  late List<String> linkedTags;
}
