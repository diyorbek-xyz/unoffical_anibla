// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_callfront.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoCallfront _$ManoCallfrontFromJson(Map<String, dynamic> json) =>
    _ManoCallfront(
      appId: json['app_id'] as String? ?? "",
      redirectUri: json['redirect_uri'] as String? ?? "",
    );

Map<String, dynamic> _$ManoCallfrontToJson(_ManoCallfront instance) =>
    <String, dynamic>{
      'app_id': instance.appId,
      'redirect_uri': instance.redirectUri,
    };
