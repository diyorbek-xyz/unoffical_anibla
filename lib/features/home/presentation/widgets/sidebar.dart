import 'package:application/core/constants/theme.dart';
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
            (e) => item(icon: e.value['icon'], label: e.value['label'], selectedIcon: e.value['selectedIcon'], index: e.key),
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
    return InkWell(
      onTap: () => widget.setIndex(index),
      mouseCursor: SystemMouseCursors.click,
      splashColor: primaryTint.withValues(alpha: 0.1),
      focusColor: primaryTint.withValues(alpha: 0.1),
      hoverColor: primaryTint.withValues(alpha: 0.1),
      highlightColor: primaryTint.withValues(alpha: 0.1),
      child: Container(
        height: size,
        color: selected ? primaryTint : Colors.transparent,
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(color: selected ? primaryDark : Colors.transparent, width: 3),
            Icon(selected ? selectedIcon : icon, color: primary, size: size - 15),
            if (expanded) Text(label),
          ],
        ),
      ),
    );
  }
}
