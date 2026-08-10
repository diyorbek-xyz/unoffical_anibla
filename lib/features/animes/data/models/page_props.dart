import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_props.g.dart';
part 'page_props.freezed.dart';

@freezed
sealed class AnimePageProps with _$AnimePageProps {
  factory AnimePageProps({
    @JsonKey(name: "type") required AnimeType animeType,
    @JsonKey(name: "anime") required String animeSlug,
    @JsonKey(name: "season") String? seasonSlug,
    @JsonKey(name: "episode") String? episodeSlug,
  }) = _AnimePageProps;
  factory AnimePageProps.fromJson(Map<String, dynamic> json) => _$AnimePagePropsFromJson(json);
}
