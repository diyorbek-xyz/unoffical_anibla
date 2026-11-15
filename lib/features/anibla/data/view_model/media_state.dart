import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_state.freezed.dart';

@freezed
abstract class MediaState with _$MediaState {
  const factory MediaState({
    @Default(true) bool isMediaLoading,
    @Default(true) bool isChaptersLoading,
    @Default(false) bool hasChaptersError,
    @Default(false) bool hasMediaError,
    @Default("") String chaptersError,
    @Default("") String mediaError,
  }) = _MediaState;
}
