import 'dart:typed_data';

import 'package:realm/realm.dart';

part 'cipher_tag.g.dart';

@RealmModel()
class _CipherTag {
  @PrimaryKey()
  @MapTo("_id")
  late String id;
  late Uint8List data;
  late Uint8List macBytes;
}
