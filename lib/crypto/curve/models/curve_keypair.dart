import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'curve_keypair.g.dart';

@JsonSerializable()
class CurveKeyPair {
  CurveKeyPair(this.privateKey, this.publicKey);

  Uint8List publicKey;
  Uint8List privateKey;

  factory CurveKeyPair.fromJson(Map<String, dynamic> json) =>
      _$CurveKeyPairFromJson(json);
  Map<String, dynamic> toJson() => _$CurveKeyPairToJson(this);
}
