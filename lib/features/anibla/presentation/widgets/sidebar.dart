import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/shared/constants/tabs.dart';
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
      leading: FloatingActionButton(
        onPressed: () {},
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: context.appColors.onSurface.withAlpha(60)),
            borderRadius: .circular(16),
            image: DecorationImage(fit: .cover, image: AssetImage("assets/images/avatar.png")),
          ),
        ),
      ),
      extended: false,
      leadingAtTop: true,
      selectedIndex: widget.shell.currentIndex,
      onDestinationSelected: (index) => widget.shell.goBranch(index, initialLocation: index == widget.shell.currentIndex),
      labelType: .selected,
      mainAxisAlignment: .end,
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
