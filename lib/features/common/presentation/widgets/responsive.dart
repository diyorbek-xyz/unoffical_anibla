import 'dart:io';

import 'package:application/main.dart';
import 'package:flutter/material.dart';

class Responsive extends InheritedWidget {
  final BoxConstraints constraints;
  final num? mobileWidth;
  const Responsive({super.key, required this.constraints, required super.child, this.mobileWidth});

  factory Responsive.of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Responsive>()!;
  }
  bool get isMobile => constraints.maxWidth < (mobileWidth ?? MOBILE_WIDTH);
  bool get isMobilePlatform => Platform.isAndroid || Platform.isIOS;
  bool get isDesktopPlatform => Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  @override
  bool updateShouldNotify(covariant Responsive oldWidget) {
    return constraints.maxWidth != oldWidget.constraints.maxWidth ||
        constraints.minWidth != oldWidget.constraints.minWidth ||
        constraints.maxHeight != oldWidget.constraints.maxHeight ||
        constraints.minHeight != oldWidget.constraints.minHeight;
  }
}
