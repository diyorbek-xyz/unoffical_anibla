import 'package:freezed_annotation/freezed_annotation.dart';

enum SortType {
  @JsonValue("latest_chapter")
  latestChapter,
  @JsonValue("newest")
  newest,
}
