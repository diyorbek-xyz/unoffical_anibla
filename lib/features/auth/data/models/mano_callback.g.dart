// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_callback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoCallback _$ManoCallbackFromJson(Map<String, dynamic> json) =>
    _ManoCallback(
      code: json['code'] as String? ?? "",
      expiresDate: json['expires_at'] as String? ?? "",
      redirectUri: json['redirect_uri'] as String? ?? "",
    );

Map<String, dynamic> _$ManoCallbackToJson(_ManoCallback instance) =>
    <String, dynamic>{
      'code': instance.code,
      'expires_at': instance.expiresDate,
      'redirect_uri': instance.redirectUri,
    };
