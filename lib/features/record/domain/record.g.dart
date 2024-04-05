// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) => Record(
      json['id'] as String,
      Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      DateTime.parse(json['createdOn'] as String),
      DateTime.parse(json['modifiedOn'] as String),
      (json['linkedTags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'id': instance.id,
      'metadata': instance.metadata,
      'createdOn': instance.createdOn.toIso8601String(),
      'modifiedOn': instance.modifiedOn.toIso8601String(),
      'linkedTags': instance.linkedTags,
    };
