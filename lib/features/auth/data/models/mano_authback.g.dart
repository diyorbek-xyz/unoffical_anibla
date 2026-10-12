// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_authback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoAuthed _$ManoAuthedFromJson(Map<String, dynamic> json) => _ManoAuthed(
  user: json['user'] == null
      ? const Profile.mano()
      : Profile.fromJson(json['user']),
  accessToken: json['access_token'] as String? ?? "",
  refreshToken: json['refresh_token'] as String? ?? "",
  expiresIn: (json['expires_in'] as num?)?.toInt() ?? 0,
  refreshExpiresIn: (json['refresh_expires_in'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ManoAuthedToJson(_ManoAuthed instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'refresh_expires_in': instance.refreshExpiresIn,
    };
