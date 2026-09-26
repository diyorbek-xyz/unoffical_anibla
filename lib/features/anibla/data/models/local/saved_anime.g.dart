// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedAnime _$SavedAnimeFromJson(Map<String, dynamic> json) => _SavedAnime(
  id: json['_id'] as String? ?? "",
  userId: json['user_id'] as String? ?? "",
  anime: json['media'] == null ? const Anime() : Anime.fromJson(json['media']),
  lastVisitedDate: json['last_visited'] as String? ?? "",
);

Map<String, dynamic> _$SavedAnimeToJson(_SavedAnime instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'media': instance.anime,
      'last_visited': instance.lastVisitedDate,
    };
