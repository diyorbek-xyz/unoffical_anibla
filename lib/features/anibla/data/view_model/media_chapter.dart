import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "media_chapter.freezed.dart";

@freezed
abstract class MediaChapter with _$MediaChapter {
  const factory MediaChapter({
    @Default(0) int total,
    @Default(0) int offset,
    @Default(false) bool isFree,
    @Default(false) bool isSaved,
    @Default(0.0) double progress,
    @Default("") String key,
    @Default("") String title,
    @Default("") String mediaUrl,
  }) = _MediaChapter;

  factory MediaChapter.fromAnime(Episode episode, {int? total, bool? isFree, bool? isSaved, double? progress}) => MediaChapter(
    isFree: isFree ?? false,
    isSaved: isSaved ?? false,
    progress: progress ?? 0.0,
    total: total ?? 0,
    key: episode.id,
    offset: episode.episodeNumber,
    mediaUrl: episode.video,
    title: episode.title.uz,
  );

  factory MediaChapter.fromBook(ManoChapter chapter, {int? total, bool? isSaved, double? progress}) => MediaChapter(
    isFree: chapter.isFree,
    isSaved: isSaved ?? false,
    progress: progress ?? 0.0,
    total: total ?? 0,
    key: chapter.id,
    offset: chapter.chapterNumber,
    mediaUrl: "",
    title: "${chapter.chapterNumber}-Bob",
  );
}
