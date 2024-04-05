// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curve_keypair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurveKeyPair _$CurveKeyPairFromJson(Map<String, dynamic> json) => CurveKeyPair(
      Uint8List.fromList(
          (json['privateKey'] as List<dynamic>).map((e) => e as int).toList()),
      Uint8List.fromList(
          (json['publicKey'] as List<dynamic>).map((e) => e as int).toList()),
    );

Map<String, dynamic> _$CurveKeyPairToJson(CurveKeyPair instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey as List<int>,
      'privateKey': instance.privateKey as List<int>,
    };
