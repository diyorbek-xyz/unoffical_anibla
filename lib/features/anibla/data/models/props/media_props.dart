import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:application/features/mano/data/models/main/novel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_props.g.dart';
part 'media_props.freezed.dart';

@freezed
abstract class MediaProps with _$MediaProps {
  factory MediaProps({required String mediaKey, required MediaType type, String? seasonKey, String? chapterKey}) = _MediaProps;
  factory MediaProps.fromJson(Map<String, dynamic> json) => _$MediaPropsFromJson(json);

  factory MediaProps.fromAnime(Anime anime, {String? chapterKey, String? seasonKey}) =>
      MediaProps(type: anime.type, mediaKey: anime.slug, chapterKey: chapterKey, seasonKey: seasonKey);
  factory MediaProps.fromManga(Manga manga, {String? chapterKey, String? seasonKey}) =>
      MediaProps(type: manga.type, mediaKey: manga.id, chapterKey: chapterKey, seasonKey: seasonKey);
  factory MediaProps.fromNovel(Novel novel, {String? chapterKey, String? seasonKey}) =>
      MediaProps(type: .novel, mediaKey: novel.id, chapterKey: chapterKey, seasonKey: seasonKey);
}
