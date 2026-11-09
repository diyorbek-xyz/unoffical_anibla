// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) => _HistoryItem(
  key: json['key'] as String? ?? "",
  age: json['age'] as String? ?? "",
  thumbnail: json['thumbnail'] as String? ?? "",
  updatedAt: json['updatedAt'] as String? ?? "",
  createdAt: json['createdAt'] as String? ?? "",
  duration: (json['duration'] as num?)?.toInt() ?? 0,
  revision: (json['revision'] as num?)?.toInt() ?? 0,
  deleted: json['deleted'] as bool? ?? false,
  completed: json['completed'] as bool? ?? false,
  id: json['_id'] as String? ?? "",
  userId: json['user_id'] as String? ?? "",
  eventAt: json['event_at'] as String? ?? "",
  eventId: json['event_id'] as String? ?? "",
  purgeAt: json['purge_at'] as String? ?? "",
  titleRu: json['title_ru'] as String? ?? "",
  titleUz: json['title_uz'] as String? ?? "",
  episodeId: json['episode_id'] as String? ?? "",
  deletedAt: json['deleted_at'] as String? ?? "",
  mediaSlug: json['media_slug'] as String? ?? "",
  currentTime: (json['current_time'] as num?)?.toInt() ?? 0,
  seasonNumber: (json['season_number'] as num?)?.toInt() ?? 0,
  episodeIndex: (json['episode_index'] as num?)?.toInt() ?? 0,
  totalEpisodes: (json['total_episodes'] as num?)?.toInt() ?? 0,
  episodeNumber: (json['episode_number'] as num?)?.toInt() ?? 0,
  availableEpisodes: (json['available_episodes'] as num?)?.toInt() ?? 0,
  mediaType: json['media_type'] == null
      ? MediaType.serie
      : MediaType.fromJson(json['media_type'] as String),
);

Map<String, dynamic> _$HistoryItemToJson(_HistoryItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'age': instance.age,
      'thumbnail': instance.thumbnail,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'duration': instance.duration,
      'revision': instance.revision,
      'deleted': instance.deleted,
      'completed': instance.completed,
      '_id': instance.id,
      'user_id': instance.userId,
      'event_at': instance.eventAt,
      'event_id': instance.eventId,
      'purge_at': instance.purgeAt,
      'title_ru': instance.titleRu,
      'title_uz': instance.titleUz,
      'episode_id': instance.episodeId,
      'deleted_at': instance.deletedAt,
      'media_slug': instance.mediaSlug,
      'current_time': instance.currentTime,
      'season_number': instance.seasonNumber,
      'episode_index': instance.episodeIndex,
      'total_episodes': instance.totalEpisodes,
      'episode_number': instance.episodeNumber,
      'available_episodes': instance.availableEpisodes,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novel',
  MediaType.comics: 'comics',
};
