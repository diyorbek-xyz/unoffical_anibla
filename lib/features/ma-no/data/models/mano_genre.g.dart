// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoGenre _$ManoGenreFromJson(Map<String, dynamic> json) => _ManoGenre(
  id: json['genre_id'] as String? ?? "",
  title: json['name'] as String? ?? "",
);

Map<String, dynamic> _$ManoGenreToJson(_ManoGenre instance) =>
    <String, dynamic>{'genre_id': instance.id, 'name': instance.title};
