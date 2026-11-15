import 'dart:math';

import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_props.g.dart';
part 'media_props.freezed.dart';

String randomTagGen() => Random().nextInt(10000).toString();

@freezed
abstract class MediaProps with _$MediaProps {
  const MediaProps._();
  const factory MediaProps({
    required MediaType type,
    required String mediaKey,
    required String thumbnail,
    required String heroTag,
    String? seasonKey,
    String? chapterKey,
  }) = _MediaProps;

  factory MediaProps.fromJson(Map<String, dynamic> json) => _$MediaPropsFromJson(json);

  factory MediaProps.fromAnime(Anime anime, {String? chapterKey, String? seasonKey, String? heroTag}) => MediaProps(
    type: anime.type,
    mediaKey: anime.slug,
    seasonKey: seasonKey,
    chapterKey: chapterKey,
    thumbnail: anime.thumbnail,
    heroTag: heroTag ?? randomTagGen(),
  );
  factory MediaProps.fromBook(Book manga, {String? chapterKey, String? seasonKey, String? heroTag}) => MediaProps(
    type: manga.type,
    mediaKey: manga.id,
    seasonKey: seasonKey,
    chapterKey: chapterKey,
    thumbnail: manga.thumbnail,
    heroTag: heroTag ?? randomTagGen(),
  );
}
