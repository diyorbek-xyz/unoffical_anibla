import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'ep_notif_model.freezed.dart';
part 'ep_notif_model.g.dart';

@freezed
@HiveType(typeId: 1251)
sealed class EpisodeNotificationModel with _$EpisodeNotificationModel {
  factory EpisodeNotificationModel({
    @HiveField(0) final String? seriesId,
    @HiveField(1) final String? seasonId,
    @HiveField(2) final String? episodeId,
    @HiveField(3) final String? seriesName,
    @HiveField(4) final String? seasonNumber,
    @HiveField(5) final String? episodeNumber,
    @HiveField(6) final String? mediaId,
    @HiveField(7) final String? mediaType,
    @HiveField(8) final String? seasonIndex,
    @HiveField(9) final String? episodeIndex,
    @HiveField(10) final String? seasonRouteIndex,
    @HiveField(11) final String? episodeRouteIndex,
    @HiveField(12) final String? mediaSlug,
    @HiveField(13) final String? imageUrl,
    @HiveField(14) final String? image,
  }) = _EpisodeNotificationModel;
  factory EpisodeNotificationModel.fromJson(Map<String, dynamic> json) => _$EpisodeNotificationModelFromJson(json);
}
