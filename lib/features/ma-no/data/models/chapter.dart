import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.g.dart';
part 'chapter.freezed.dart';

@freezed
abstract class Chapter with _$Chapter {
  const factory Chapter({
    @Default("") @JsonKey(name: "chapter_id") String id,
    @Default(0) @JsonKey(name: "chapter_number") int chapterNumber,
    @Default("") @JsonKey(name: "release_date") String releaseDate,
    @Default(0) @JsonKey(name: "views_count") int viewsCount,
    @Default(0) @JsonKey(name: "likes_count") int likesCount,
    @Default(false) @JsonKey(name: "is_read") bool isRead,
    @Default(false) @JsonKey(name: "is_liked") bool isLiked,
    @Default(false) @JsonKey(name: "is_free") bool isFree,
  }) = _Chapter;
  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}
