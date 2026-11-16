import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_props.g.dart';
part 'media_props.freezed.dart';

@freezed
abstract class MediaProps with _$MediaProps {
  const MediaProps._();
  const factory MediaProps({required MediaType type, required String mediaKey, String? seasonKey, String? chapterKey}) =
      _MediaProps;

  factory MediaProps.fromJson(Map<String, dynamic> json) => _$MediaPropsFromJson(json);

  factory MediaProps.fromAnime(Anime anime, {String? chapterKey, String? seasonKey}) =>
      MediaProps(type: anime.type, mediaKey: anime.slug, seasonKey: seasonKey, chapterKey: chapterKey);
  factory MediaProps.fromBook(Book manga, {String? chapterKey, String? seasonKey}) =>
      MediaProps(type: manga.type, mediaKey: manga.id, seasonKey: seasonKey, chapterKey: chapterKey);
}
