import 'dart:io';
import 'package:application/core/utils/utils.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';

class Responsive extends InheritedWidget {
  final BoxConstraints constraints;
  final num? mobileWidth;
  const Responsive({super.key, required this.constraints, required super.child, this.mobileWidth});

  factory Responsive.of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Responsive>()!;
  }
  static Widget provider(Widget Function(BuildContext context, Responsive responsive) builder) {
    return LayoutBuilder(
      builder: (context, constraints) => Responsive(
        constraints: constraints,
        child: Builder(builder: (context) => builder(context, Responsive.of(context))),
      ),
    );
  }

  bool get isMobileWidth => constraints.maxWidth < (mobileWidth ?? MOBILE_WIDTH);
  bool get isMobilePlatform => Platform.isAndroid || Platform.isIOS;
  bool get isDesktopPlatform => Platform.isLinux || Platform.isMacOS || Platform.isWindows;
  bool get isMobile => isMobileWidth || isMobilePlatform;
  bool get isDesktop => !isMobileWidth || isDesktopPlatform;

  @override
  bool updateShouldNotify(covariant Responsive oldWidget) {
    return constraints.maxWidth != oldWidget.constraints.maxWidth ||
        constraints.minWidth != oldWidget.constraints.minWidth ||
        constraints.maxHeight != oldWidget.constraints.maxHeight ||
        constraints.minHeight != oldWidget.constraints.minHeight;
  }
}

class PlatformBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints, bool isMobile, Widget child)? containerBuilder;
  final Widget Function(BuildContext context, bool isMobile)? desktopBuilder;
  final Widget Function(BuildContext context, bool isMobile)? mobileBuilder;
  final bool Function(bool isMobilePlatform, bool isMobileWidth)? whenMobile;
  final Widget? child;
  const PlatformBuilder({super.key, this.child, this.containerBuilder, this.desktopBuilder, this.mobileBuilder, this.whenMobile});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final isMobile = constraints.maxWidth < MOBILE_WIDTH;
      final mustMobile = whenMobile?.call(Utils.isMobilePlatform, constraints.maxWidth < MOBILE_WIDTH);
      final theChild = builder(context, constraints, mustMobile);
      if (containerBuilder != null && theChild != null) return containerBuilder!(context, constraints, (mustMobile ?? isMobile), theChild);
      if (theChild != null) return theChild;
      throw Exception('Birnima ber menga');
    },
  );

  Widget? builder(BuildContext context, BoxConstraints constraints, bool? mustMobile) {
    final isMobile = constraints.maxWidth < MOBILE_WIDTH;
    final isDesktop = constraints.maxWidth >= MOBILE_WIDTH;
    final mobile = mobileBuilder?.call(context, isMobile);
    final desktop = desktopBuilder?.call(context, isDesktop);
    print(mustMobile);
    print(isMobile);
    if ((mustMobile ?? isMobile) && mobile != null) return mobile;
    print("Hello");
    if (isDesktop && desktop != null) return desktop;
    if (child != null) return child!;
    return null;
  }
}
