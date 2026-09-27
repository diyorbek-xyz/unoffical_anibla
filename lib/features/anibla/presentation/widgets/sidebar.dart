import 'package:application/core/constants/tabs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatefulWidget {
  final StatefulNavigationShell shell;
  const Sidebar({super.key, required this.shell});

  double get width => 200;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: false,
      selectedIndex: widget.shell.currentIndex,
      onDestinationSelected: (index) => widget.shell.goBranch(index, initialLocation: index == widget.shell.currentIndex),
      labelType: .selected,
      mainAxisAlignment: .center,
      destinations: desktopTabs
          .map(
            (e) => NavigationRailDestination(
              icon: Icon(e.icon),
              label: Text(e.label, textAlign: .center),
              selectedIcon: Icon(e.activeIcon),
            ),
          )
          .toList(),
    );
  }
}
