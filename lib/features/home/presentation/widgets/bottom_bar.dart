import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int index;
  final Function(int) setIndex;
  const BottomBar({super.key, required this.index, required this.setIndex});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return BottomNavigationBar(
      currentIndex: index,
      onTap: setIndex,
      unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.5),
      iconSize: 30,
      useLegacyColorScheme: false,
      items: tabs
          .map(
            (e) => BottomNavigationBarItem(
              tooltip: e['label'],
              icon: Icon(e['icon']),
              label: e['label'],
              activeIcon: Icon(e['selectedIcon']),
            ),
          )
          .toList(),
    );
  }
}

List<dynamic> tabs = [
  {"icon": Icons.home_outlined, "label": "Home", "selectedIcon": Icons.home_rounded},
  {"icon": Icons.grid_view_outlined, "label": "Explore", "selectedIcon": Icons.grid_view_rounded},
  {"icon": Icons.bookmark_outline, "label": "Saved", "selectedIcon": Icons.bookmark_rounded},
  {"icon": Icons.person_outline, "label": "Profile", "selectedIcon": Icons.person_rounded},
];
