import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:flutter/material.dart';

class CreatorsMenu extends StatelessWidget {
  final List<(String, String)> creators;
  const CreatorsMenu(this.creators, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: CustomScrollView(
          key: const PageStorageKey("creators"),
          scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverList.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                final creator = creators.elementAt(index);
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: imageProviderFallback(creator.$2),
                    onBackgroundImageError: (exception, stackTrace) => exception.toString(),
                  ),
                  title: Text(creator.$1, style: TextStyle(color: context.appColors.primary)),
                );
              },
              itemCount: creators.length,
            ),
          ],
        ),
      ),
    );
  }
}
