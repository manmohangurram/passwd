import 'package:json_annotation/json_annotation.dart';
import 'package:passwd/features/record/domain/metadata.dart';

part 'record.g.dart';

@JsonSerializable()
class Record {
  Record(
      this.id, this.metadata, this.createdOn, this.modifiedOn, this.linkedTags);

  String id;
  Metadata metadata;
  DateTime createdOn;
  DateTime modifiedOn;
  List<String> linkedTags;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
  Map<String, dynamic> toJson() => _$RecordToJson(this);
}
