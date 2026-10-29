import 'package:application/features/mano/data/models/data/chapter_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'mano_chapter.g.dart';
part 'mano_chapter.freezed.dart';

@freezed
@HiveType(typeId: 8634)
abstract class ManoChapter with _$ManoChapter {
  const factory ManoChapter({
    @HiveField(0) @Default("") @JsonKey(name: "chapter_id") String id,
    @HiveField(1) @Default(0) @JsonKey(name: "chapter_number") int chapterNumber,
    @HiveField(2) @Default("") @JsonKey(name: "release_date") String releaseDate,
    @HiveField(3) @Default(0) @JsonKey(name: "views_count") int viewsCount,
    @HiveField(4) @Default(0) @JsonKey(name: "likes_count") int likesCount,
    @HiveField(5) @Default(false) @JsonKey(name: "is_read") bool isRead,
    @HiveField(6) @Default(false) @JsonKey(name: "is_liked") bool isLiked,
    @HiveField(7) @Default(false) @JsonKey(name: "is_free") bool isFree,
    @HiveField(8) @Default([]) @JsonKey(name: "pages") List<ChapterPage> pages,
    @HiveField(9) @Default("") @JsonKey(name: "title") String title,
  }) = _ManoChapter;
  factory ManoChapter.fromJson(Map<String, dynamic> json) => _$ManoChapterFromJson(json);
}
