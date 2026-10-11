// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Avatar _$AvatarFromJson(Map<String, dynamic> json) => _Avatar(
  id: json['id'] as String? ?? "",
  title: json['title'] as String? ?? "",
);

Map<String, dynamic> _$AvatarToJson(_Avatar instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
};

_AvatarGroup _$AvatarGroupFromJson(Map<String, dynamic> json) => _AvatarGroup(
  title: json['title'] as String? ?? "",
  assets:
      (json['assets'] as List<dynamic>?)
          ?.map((e) => Avatar.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AvatarGroupToJson(_AvatarGroup instance) =>
    <String, dynamic>{'title': instance.title, 'assets': instance.assets};
