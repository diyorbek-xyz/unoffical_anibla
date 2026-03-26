import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/home/presentation/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final int index;
  final void Function(int) setIndex;
  const Sidebar({super.key, required this.index, required this.setIndex});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool expanded = false;
  void toggleExpand() {
    setState(() => expanded = !expanded);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? 240 : 65,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: expanded ? AlignmentGeometry.centerStart : AlignmentGeometry.center,
            padding: EdgeInsets.all(10),
            child: IconButton(onPressed: toggleExpand, icon: Icon(Icons.menu)),
          ),

          ...tabs.asMap().entries.map(
            (e) => item(
              icon: e.value['icon'],
              label: e.value['label'],
              selectedIcon: e.value['selectedIcon'],
              index: e.key,
            ),
          ),
        ],
      ),
    );
  }

  Widget item({
    int index = 0,
    double size = 50,
    String label = "",
    IconData selectedIcon = Icons.home_rounded,
    IconData icon = Icons.home_outlined,
  }) {
    final selected = widget.index == index;
    final colors = context.appColors;
    final tintcolor = selected ? colors.onPrimary.withAlpha(50) : colors.primary.withAlpha(10);
    return InkWell(
      onTap: () => widget.setIndex(index),
      mouseCursor: SystemMouseCursors.click,
      splashColor: tintcolor,
      focusColor: tintcolor,
      hoverColor: tintcolor,
      highlightColor: tintcolor,
      child: Ink(
        height: size,
        color: selected ? colors.primary : Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: expanded ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(
              selected ? selectedIcon : icon,
              color: selected ? colors.onPrimary : colors.primary,
              size: size - (selected ? 15 : 20),
            ),
            if (expanded)
              Text(label, style: TextStyle(color: selected ? colors.onPrimary : colors.primary)),
          ],
        ),
      ),
    );
  }
}
