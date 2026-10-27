import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/view/media_info_entry.dart';
import 'package:flutter/material.dart';

class AnimeInfosMenu extends StatelessWidget {
  final List<MediaInfoEntry> entries;
  const AnimeInfosMenu(this.entries, {super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textTheme.titleLarge;
    final bodyStyle = context.textTheme.bodyLarge;
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
      key: const PageStorageKey("infos"),
      slivers: [
        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: AlignmentGeometry.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: entries
                    .map(
                      (e) => switch (e) {
                        Custom() => [Text(e.label, style: titleStyle), e.child, SizedBox(height: 10)],
                        Single() => [Text(e.label, style: titleStyle), Text(e.value, style: bodyStyle), SizedBox(height: 10)],
                        Multi() => [
                          Text(e.label, style: titleStyle),
                          Wrap(spacing: 10, runSpacing: 10, children: e.children),
                          SizedBox(height: 10),
                        ],
                        MultiActions() => [
                          Text(e.label, style: titleStyle),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: e.value.map((a) => ActionChip(label: Text(a), onPressed: () {})).toList(),
                          ),
                          SizedBox(height: 10),
                        ],
                      },
                    )
                    .expand((e) => e)
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
