import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Recommends extends StatefulWidget {
  final List<Widget> items;
  final VoidCallback? onMoreClick;
  final String title;
  final IconData icon;
  final bool hasPadding;
  const Recommends({
    super.key,
    required this.title,
    required this.items,
    this.onMoreClick,
    this.hasPadding = true,
    this.icon = Icons.local_fire_department_outlined,
  });

  @override
  State<Recommends> createState() => _RecommendsState();
}

class _RecommendsState extends State<Recommends> {
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: .antiAlias,
      type: .transparency,
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .start,
        children: [
          ListTile(
            minVerticalPadding: 25,
            leading: Icon(widget.icon, size: context.textTheme.headlineMedium!.fontSize),
            title: Text(
              toBeginningOfSentenceCase(widget.title),
              style: context.isMobile ? context.textTheme.headlineSmall : context.textTheme.headlineMedium,
            ),
            trailing: IconButton(onPressed: widget.onMoreClick, icon: Icon(Icons.keyboard_arrow_right)),
          ),
          SingleChildScrollView(
            scrollDirection: .horizontal,
            padding: .symmetric(horizontal: context.isMobile ? 10 : 0),
            clipBehavior: .none,
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Row(spacing: 10, children: widget.items),
          ),
        ],
      ),
    );
  }
}
