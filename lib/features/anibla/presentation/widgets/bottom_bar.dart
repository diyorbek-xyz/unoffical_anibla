import 'package:application/core/constants/tabs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  final StatefulNavigationShell shell;
  const BottomBar({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (index) {
        shell.goBranch(index, initialLocation: index == shell.currentIndex);
      },
      selectedIndex: shell.currentIndex,
      maintainBottomViewPadding: false,
      destinations: mobileTabs
          .map((e) => NavigationDestination(tooltip: e.label, icon: Icon(e.icon), label: e.label, selectedIcon: Icon(e.activeIcon)))
          .toList(),
    );
  }
}
