import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_view.freezed.dart';

@freezed
abstract class ActionView with _$ActionView {
  const factory ActionView({String? title, required IconData icon, required VoidCallback action}) = _ActionView;
}
