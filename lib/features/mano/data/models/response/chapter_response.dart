import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_response.g.dart';
part 'chapter_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class ChapterResponse<T> with _$ChapterResponse<T> {
  const factory ChapterResponse({required T chapters, @Default(0) int limit, @Default(0) int offset, @Default(0) int total}) = _ChapterResponse<T>;

  factory ChapterResponse.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ChapterResponseFromJson<T>(json, fromJsonT);
}
