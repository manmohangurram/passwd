import 'package:json_annotation/json_annotation.dart';
import 'package:passwd/crypto/curve/models/curve_keypair.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(this.id, this.name, this.keyPair);

  String id;
  String name;
  CurveKeyPair keyPair;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
