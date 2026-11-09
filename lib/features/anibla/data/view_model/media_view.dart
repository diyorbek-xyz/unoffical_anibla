import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/view_model/media_chapter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "media_view.freezed.dart";

@freezed
abstract class MediaView with _$MediaView {
  const factory MediaView({
    @Default(MediaType.comics) MediaType type,
    @Default(0) int releaseYear,
    @Default(0) int ageRestriction,
    @Default(0) int views,
    @Default(0) int likes,
    @Default(0) int saves,
    @Default("") String cover,
    @Default("") String title,
    @Default("") String author,
    @Default("") String studio,
    @Default("") String thumbnail,
    @Default("") String description,
    @Default([]) List<String> frames,
    @Default({}) Map<String, String> genres,
    @Default({}) Map<String, String> categories,
    @Default({}) Map<String, String> translators,
    @Default([]) List<MediaChapter> chapters,
    required void Function(String? chapter) openMedia,
  }) = _MediaView;
}
