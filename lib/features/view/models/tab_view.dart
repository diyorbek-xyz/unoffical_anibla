import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_view.freezed.dart';

@freezed
abstract class TabView with _$TabView {
  const factory TabView(TabItem tab, Widget view) = _TabView;
}

@freezed
abstract class TabItem with _$TabItem {
  const factory TabItem({@Default(Icons.abc) IconData activeIcon, @Default(Icons.abc) IconData icon, @Default("") String label}) =
      _TabItem;
}
