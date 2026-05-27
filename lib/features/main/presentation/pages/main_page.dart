import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/constants/spacings.dart';
import 'package:application/features/main/presentation/widgets/bottom_bar.dart';
import 'package:application/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell shell;
  const MainPage({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < MOBILE_WIDTH;
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: !isMobile ? appBar(context) : null,
          body: shell,
          bottomNavigationBar: isMobile ? BottomBar(shell: shell) : null,
        );
      },
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      notificationPredicate: (notification) => true,
      primary: true,
      toolbarHeight: appbarHeight,
      automaticallyImplyLeading: false,
      backgroundColor: context.appColors.surface,
      foregroundColor: context.appColors.primary,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actionsPadding: EdgeInsets.zero,
      leadingWidth: 200,
      leading: logo(context),
      actions: [actionButton(() => context.goNamed("home"), "Home"), actionButton(() => context.goNamed("explore"), "Explore"), profile(context)],
    );
  }

  SizedBox actionButton(void Function() onTap, String title) {
    return SizedBox(
      height: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Container(padding: EdgeInsetsGeometry.symmetric(horizontal: 20), alignment: .center, child: Text(title)),
      ),
    );
  }

  InkWell logo(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: () => context.goNamed("home"),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
        child: Ink.image(image: AssetImage("assets/images/logo.png"), height: 70, fit: .contain),
      ),
    );
  }

  Widget profile(BuildContext context) => SizedBox(
    width: 140,
    child: Stack(
      alignment: .center,
      fit: .expand,
      clipBehavior: .none,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(8).add(EdgeInsetsGeometry.symmetric(horizontal: 30)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Ink(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: CachedNetworkImageProvider("https://static.crunchyroll.com/assets/avatar/170x170/rezero_s3_avatar_23.png"),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.all(3).add(EdgeInsetsGeometry.symmetric(horizontal: 30)),
          child: Ink(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/decors/gojo.png'))),
          ),
        ),
        InkWell(mouseCursor: SystemMouseCursors.click, onTap: () => context.goNamed("profile")),
      ],
    ),
  );
}
