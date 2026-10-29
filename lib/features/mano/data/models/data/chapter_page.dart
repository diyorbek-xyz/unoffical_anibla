import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'chapter_page.g.dart';
part 'chapter_page.freezed.dart';

@freezed
@HiveType(typeId: 8689)
abstract class ChapterPage with _$ChapterPage {
  const factory ChapterPage({
    @HiveField(0) @Default("") @JsonKey(name: "page_id") String id,
    @HiveField(1) @Default("") @JsonKey(name: "image_url") String imageUrl,
    @HiveField(2) @Default("") @JsonKey(name: "chapter_id") String chapterId,
    @HiveField(3) @Default(0) @JsonKey(name: "page_number") int pageNumber,
    @HiveField(4) @Default(0) @JsonKey(name: "width") int width,
    @HiveField(5) @Default(0) @JsonKey(name: "height") int height,
  }) = _ChapterPage;
  factory ChapterPage.fromJson(Map<String, dynamic> json) => _$ChapterPageFromJson(json);
}
