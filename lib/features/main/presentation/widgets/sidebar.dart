import 'package:application/features/main/presentation/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatefulWidget {
  final StatefulNavigationShell shell;
  const Sidebar({super.key, required this.shell});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool expanded = false;
  void toggleExpand() {
    setState(() => expanded = !expanded);
  }

  void setIndex(int index) {
    widget.shell.goBranch(index, initialLocation: index == widget.shell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      leadingAtTop: false,
      leading: Align(
        alignment: AlignmentGeometry.topLeft,
        child: IconButton(onPressed: toggleExpand, icon: Icon(Icons.menu)),
      ),
      groupAlignment: -1,
      minExtendedWidth: 200,
      extended: expanded,
      selectedIndex: widget.shell.currentIndex,
      labelType: expanded ? NavigationRailLabelType.none : NavigationRailLabelType.all,
      onDestinationSelected: setIndex,
      destinations: tabs
          .map(
            (e) => NavigationRailDestination(
              icon: Icon(e['icon']),
              label: Text(e['label']),
              selectedIcon: Icon(e['selectedIcon']),
            ),
          )
          .toList(),
    );
  }
}
