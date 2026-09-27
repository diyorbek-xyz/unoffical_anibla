import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_page_props.g.dart';
part 'anime_page_props.freezed.dart';

@freezed
abstract class AnimePageProps with _$AnimePageProps {
  const factory AnimePageProps({
    @JsonKey(name: "type") required AnimeType animeType,
    @JsonKey(name: "anime") required String animeSlug,
    @JsonKey(name: "season") String? seasonSlug,
    @JsonKey(name: "episode") String? episodeSlug,
    @JsonKey(name: "video") String? localPath,
  }) = _AnimePageProps;
  factory AnimePageProps.fromJson(Map<String, dynamic> json) => _$AnimePagePropsFromJson(json);
}
