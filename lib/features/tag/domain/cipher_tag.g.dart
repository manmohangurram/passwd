// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cipher_tag.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CipherTag extends _CipherTag
    with RealmEntity, RealmObjectBase, RealmObject {
  CipherTag(
    String id,
    Uint8List data,
    Uint8List macBytes,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'data', data);
    RealmObjectBase.set(this, 'macBytes', macBytes);
  }

  CipherTag._();

  @override
  String get id => RealmObjectBase.get<String>(this, '_id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, '_id', value);

  @override
  Uint8List get data =>
      RealmObjectBase.get<Uint8List>(this, 'data') as Uint8List;
  @override
  set data(Uint8List value) => RealmObjectBase.set(this, 'data', value);

  @override
  Uint8List get macBytes =>
      RealmObjectBase.get<Uint8List>(this, 'macBytes') as Uint8List;
  @override
  set macBytes(Uint8List value) => RealmObjectBase.set(this, 'macBytes', value);

  @override
  Stream<RealmObjectChanges<CipherTag>> get changes =>
      RealmObjectBase.getChanges<CipherTag>(this);

  @override
  CipherTag freeze() => RealmObjectBase.freezeObject<CipherTag>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CipherTag._);
    return const SchemaObject(ObjectType.realmObject, CipherTag, 'CipherTag', [
      SchemaProperty('id', RealmPropertyType.string,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('data', RealmPropertyType.binary),
      SchemaProperty('macBytes', RealmPropertyType.binary),
    ]);
  }
}
