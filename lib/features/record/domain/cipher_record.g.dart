// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cipher_record.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CipherRecord extends _CipherRecord
    with RealmEntity, RealmObjectBase, RealmObject {
  CipherRecord(
    String id,
    Uint8List data,
    DateTime createdOn,
    DateTime modifiedOn, {
    Iterable<String> linkedTags = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'data', data);
    RealmObjectBase.set(this, 'createdOn', createdOn);
    RealmObjectBase.set(this, 'modifiedOn', modifiedOn);
    RealmObjectBase.set<RealmList<String>>(
        this, 'linkedTags', RealmList<String>(linkedTags));
  }

  CipherRecord._();

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
  DateTime get createdOn =>
      RealmObjectBase.get<DateTime>(this, 'createdOn') as DateTime;
  @override
  set createdOn(DateTime value) =>
      RealmObjectBase.set(this, 'createdOn', value);

  @override
  DateTime get modifiedOn =>
      RealmObjectBase.get<DateTime>(this, 'modifiedOn') as DateTime;
  @override
  set modifiedOn(DateTime value) =>
      RealmObjectBase.set(this, 'modifiedOn', value);

  @override
  RealmList<String> get linkedTags =>
      RealmObjectBase.get<String>(this, 'linkedTags') as RealmList<String>;
  @override
  set linkedTags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<CipherRecord>> get changes =>
      RealmObjectBase.getChanges<CipherRecord>(this);

  @override
  CipherRecord freeze() => RealmObjectBase.freezeObject<CipherRecord>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CipherRecord._);
    return const SchemaObject(
        ObjectType.realmObject, CipherRecord, 'CipherRecord', [
      SchemaProperty('id', RealmPropertyType.string,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('data', RealmPropertyType.binary),
      SchemaProperty('createdOn', RealmPropertyType.timestamp),
      SchemaProperty('modifiedOn', RealmPropertyType.timestamp),
      SchemaProperty('linkedTags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}
