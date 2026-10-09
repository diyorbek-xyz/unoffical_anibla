import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_props.g.dart';
part 'player_props.freezed.dart';

@freezed
abstract class MediaStream with _$MediaStream {
  const MediaStream._();
  factory MediaStream({
    required MediaType type,
    required String animeTitle,
    required String episodeTitle,
    required String cover,
    required String url,
    @Default(0) int episode,
    @Default(0) int totalEpisodes,
    @Default(Duration.zero) Duration startTime,
    String? forCache,
    String? offlineUrl,
  }) = _MediaStream;
  factory MediaStream.fromJson(Map<String, dynamic> json) => _$MediaStreamFromJson(json);
  MediaStream copyEpisode(Episode episode, {String? offline, Duration startTime = Duration.zero, String? forCache}) => copyWith(
    episodeTitle: episode.title.uz,
    episode: episode.episodeNumber,
    url: episode.video,
    offlineUrl: offline,
    startTime: startTime,
    forCache: forCache,
  );
}
