import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "media_view.freezed.dart";

@freezed
abstract class MediaView with _$MediaView {
  const factory MediaView({
    @Default("") String cover,
    @Default("") String title,
    @Default("") String error,
    @Default(false) bool hasError,
    @Default(false) bool isLoading,
    @Default([]) List<Tab> tabs,
    @Default("") String thumbnail,
    @Default([]) List<Widget> views,
    @Default([]) List<MapEntry<String, Object>> items,
  }) = _MediaView;
}
