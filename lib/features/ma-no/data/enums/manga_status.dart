import 'package:freezed_annotation/freezed_annotation.dart';

enum MangaStatus {
  @JsonValue('continue')
  continuing,
  stopped,
  finished,
}
