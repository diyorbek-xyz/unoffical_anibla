import 'package:application/shared/utils/utils.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';

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
    if ((mustMobile ?? isMobile) && mobile != null) return mobile;
    if (isDesktop && desktop != null) return desktop;
    if (child != null) return child!;
    return null;
  }
}
