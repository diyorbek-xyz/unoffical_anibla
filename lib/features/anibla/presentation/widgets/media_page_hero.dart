import 'dart:ui';

import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/shared/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MediaPageHero extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final String thumbnail;
  final bool isSaved;
  final List<MapEntry<String, Object>> items;
  final bool isScrolled;
  const MediaPageHero({
    super.key,
    required this.isScrolled,
    required this.isSaved,
    required this.items,
    required this.tabs,
    required this.thumbnail,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => SliverOverlapAbsorber(
    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    sliver: SliverAppBar.medium(
      leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.keyboard_arrow_left)),
      automaticallyImplyLeading: true,
      scrolledUnderElevation: 0.0,
      toolbarHeight: kToolbarHeight,
      stretch: true,
      centerTitle: false,
      forceElevated: isScrolled,
      expandedHeight: 350 + kTextTabBarHeight + kToolbarHeight,
      collapsedHeight: kTextTabBarHeight + kToolbarHeight + MediaQuery.paddingOf(context).top,
      title: Text(title),
      bottom: TabBar(tabAlignment: TabAlignment.center, isScrollable: true, dividerHeight: 0, indicatorWeight: 3, tabs: tabs),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProviderFallback(thumbnail),
              opacity: 0.6,
              alignment: AlignmentGeometry.xy(0, -0.7),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentGeometry.center,
                  end: AlignmentGeometry.bottomCenter,
                  colors: [Colors.transparent, context.appColors.surface],
                ),
              ),
              padding: EdgeInsetsGeometry.only(top: kToolbarHeight, left: 10, right: 10),
              alignment: AlignmentGeometry.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: .min,
                  spacing: 20,
                  children: [
                    Text(title, style: context.textTheme.headlineMedium),
                    SizedBox(
                      height: 250,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                              clipBehavior: Clip.antiAlias,
                              constraints: BoxConstraints(maxWidth: 300, minWidth: 100),
                              child: AspectRatio(
                                aspectRatio: 0.65,
                                child: isUsable(thumbnail)
                                    ? SafeImage(imageUrl: thumbnail, fit: BoxFit.cover)
                                    : Skeleton.leaf(enabled: true, child: Container(color: context.appColors.error)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: .start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(spacing: 5, crossAxisAlignment: .start, children: items.map(infoItem).toList()),
                                FilledButton.icon(
                                  onPressed: () {},
                                  icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline),
                                  label: Text(isSaved ? "O'chirish" : "Saqlash"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Widget infoItem(MapEntry<String, dynamic> item) => Builder(
    builder: (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.key, style: TextStyle(fontSize: context.textTheme.titleSmall?.fontSize)),
        itemValue(context, item.value.toString()),
      ],
    ),
  );

  Widget itemValue(BuildContext context, String text) => Text(
    text,
    style: TextStyle(
      fontSize: context.textTheme.titleLarge?.fontSize,
      fontWeight: FontWeight.bold,
      color: context.appColors.primary,
    ),
  );
}
