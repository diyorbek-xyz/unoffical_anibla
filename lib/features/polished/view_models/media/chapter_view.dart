import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "chapter_view.freezed.dart";

@freezed
abstract class ChapterView with _$ChapterView {
  const ChapterView._();
  const factory ChapterView({
    @Default(0) int total,
    @Default(0) int offset,
    @Default(false) bool isFree,
    @Default(false) bool isSaved,
    @Default(0.0) double progress,
    @Default("") String key,
    @Default("") String title,
    @Default("") String mediaUrl,
    required MediaType type,
  }) = _MediaChapter;

  factory ChapterView.fromAnime(Episode episode, {int? total, bool? isFree, bool? isSaved, double? progress}) => ChapterView(
    type: .serie,
    isFree: isFree ?? false,
    isSaved: isSaved ?? false,
    progress: progress ?? 0.0,
    total: total ?? 0,
    key: episode.id,
    offset: episode.episodeNumber,
    mediaUrl: episode.video,
    title: episode.title.uz,
  );

  factory ChapterView.fromBook(ManoChapter chapter, {int? total, bool? isSaved, double? progress, MediaType? type}) =>
      ChapterView(
        type: type ?? .comics,
        isFree: chapter.isFree,
        isSaved: isSaved ?? false,
        progress: progress ?? 0.0,
        total: total ?? 0,
        key: chapter.id,
        offset: chapter.chapterNumber,
        mediaUrl: "",
        title: "${chapter.chapterNumber}-Bob",
      );

  String get pagePath => type.isAnime ? "watch" : "read";
}
