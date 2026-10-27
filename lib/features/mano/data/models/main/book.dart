import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/mano/data/models/data/book_status.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/data/mano_category.dart';
import 'package:application/features/mano/data/models/data/mano_genre.dart';
import 'package:application/features/mano/data/models/data/mano_translator.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part "book.g.dart";
part "book.freezed.dart";

@HiveType(typeId: 6234)
@Freezed(fromJson: true, toJson: true)
abstract class Book with _$Book {
  const factory Book({
    @HiveField(0) @Default("") String slug,
    @HiveField(1) @Default("") String title,
    @HiveField(2) @Default("") String description,
    @HiveField(3) @Default([]) List<ManoGenre> genres,
    @HiveField(4) @Default([]) List<ManoChapter> chapters,
    @HiveField(5) @Default([]) List<ManoCategory> categories,
    @HiveField(6) @Default([]) List<ManoTranslator> translators,
    @HiveField(7) @Default(0) @JsonKey(name: "likes_count") int likesCount,
    @HiveField(8) @Default(0) @JsonKey(name: "views_count") int viewsCount,
    @HiveField(9) @Default(0) @JsonKey(name: "release_year") int releaseYear,
    @HiveField(10) @Default(0) @JsonKey(name: "average_rating") int averageRating,
    @HiveField(11) @Default(0) @JsonKey(name: "chapters_count") int chaptersCount,
    @HiveField(12) @Default(0) @JsonKey(name: "bookmarked_count") int bookmarkedCount,
    @HiveField(13) @Default(false) @JsonKey(name: "is_showed") bool isShowed,
    @HiveField(14) @Default(false) @JsonKey(name: "is_bookmarked") bool isBookmarked,
    @HiveField(15) @Default(MediaType.novel) MediaType type,
    @HiveField(26) @Default(false) @JsonKey(name: "is_comment_enabled") bool isCommentEnabled,
    @HiveField(16) @Default("") String id,
    @HiveField(17) @Default("") @JsonKey(name: "real_link") String realLink,
    @HiveField(18) @Default("") @JsonKey(name: "image_url") String thumbnail,
    @HiveField(19) @Default("") @JsonKey(name: "updated_at") String updatedAt,
    @HiveField(20) @Default("") @JsonKey(name: "created_at") String createdAt,
    @HiveField(21) @Default("") @JsonKey(name: "second_title") String secondTitle,
    @HiveField(22) @Default("") @JsonKey(name: "showing_date") String showingDate,
    @HiveField(23) @Default("") @JsonKey(name: "age_restriction") String ageRestriction,
    @HiveField(24) @Default(BookStatus.stopped) @JsonKey(name: "release_status") BookStatus releaseStatus,
    @HiveField(25) @Default(BookStatus.stopped) @JsonKey(name: "translation_status") BookStatus translationStatus,
  }) = _Book;
  factory Book.fromJson(Map<String, dynamic> json) {
    final id = json["novel_id"] ?? json["manga_id"];
    return _$BookFromJson(json.withValue("id", id));
  }
}
