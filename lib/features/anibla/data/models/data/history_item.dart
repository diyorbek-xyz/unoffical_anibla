import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'history_item.g.dart';
part 'history_item.freezed.dart';

@Freezed(fromJson: true, toJson: true)
abstract class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    @Default("") String key,
    @Default("") String age,
    @Default("") String thumbnail,
    @Default("") String updatedAt,
    @Default("") String createdAt,
    @Default(0) int duration,
    @Default(0) int revision,
    @Default(false) bool deleted,
    @Default(false) bool completed,
    @Default("") @JsonKey(name: "_id") String id,
    @Default("") @JsonKey(name: "user_id") String userId,
    @Default("") @JsonKey(name: "event_at") String eventAt,
    @Default("") @JsonKey(name: "event_id") String eventId,
    @Default("") @JsonKey(name: "purge_at") String purgeAt,
    @Default("") @JsonKey(name: "title_ru") String titleRu,
    @Default("") @JsonKey(name: "title_uz") String titleUz,
    @Default("") @JsonKey(name: "episode_id") String episodeId,
    @Default("") @JsonKey(name: "deleted_at") String deletedAt,
    @Default("") @JsonKey(name: "media_slug") String mediaSlug,
    @Default(0) @JsonKey(name: "current_time") int currentTime,
    @Default(0) @JsonKey(name: "season_number") int seasonNumber,
    @Default(0) @JsonKey(name: "episode_index") int episodeIndex,
    @Default(0) @JsonKey(name: "total_episodes") int totalEpisodes,
    @Default(0) @JsonKey(name: "episode_number") int episodeNumber,
    @Default(0) @JsonKey(name: "available_episodes") int availableEpisodes,
    @Default(MediaType.serie) @JsonKey(name: "media_type") MediaType mediaType,
  }) = _HistoryItem;

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return _$HistoryItemFromJson(json.withValue("media_type", toBeginningOfSentenceCase(json['media_type'])));
  }
}
