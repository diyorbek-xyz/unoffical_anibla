import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'episode_notf.freezed.dart';
part 'episode_notf.g.dart';

@freezed
@HiveType(typeId: 1251)
abstract class EpisodeNotification with _$EpisodeNotification {
  const factory EpisodeNotification({
    @Default("") @HiveField(0) String seriesId,
    @Default("") @HiveField(1) String seasonId,
    @Default("") @HiveField(2) String episodeId,
    @Default("") @HiveField(3) String seriesName,
    @Default("") @HiveField(4) String seasonNumber,
    @Default("") @HiveField(5) String episodeNumber,
    @Default("") @HiveField(6) String mediaId,
    @Default("") @HiveField(7) String mediaType,
    @Default("") @HiveField(8) String seasonIndex,
    @Default("") @HiveField(9) String episodeIndex,
    @Default("") @HiveField(10) String seasonRouteIndex,
    @Default("") @HiveField(11) String episodeRouteIndex,
    @Default("") @HiveField(12) String mediaSlug,
    @Default("") @HiveField(13) String imageUrl,
    @Default("") @HiveField(14) String image,
  }) = _EpisodeNotification;
  factory EpisodeNotification.fromJson(Map<String, dynamic> json) => _$EpisodeNotificationFromJson(json);
}
