import 'package:application/constants/tabs.dart';
import 'package:flutter/material.dart';

class WidgetSidebar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onDestinationSelected;

  const WidgetSidebar({super.key, required this.selectedIndex, required this.onDestinationSelected});
  @override
  State<StatefulWidget> createState() => _Sidebar();
}

class _Sidebar extends State<WidgetSidebar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: NavigationRail(
        extended: true,
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: widget.onDestinationSelected,
        leadingAtTop: true,
        leading: SizedBox(
          height: 100,
          child: Center(child: Image(width: 200, image: AssetImage('assets/images/logo.png'))),
        ),
        destinations: tabs.map((tab) {
          return NavigationRailDestination(icon: tab['icon'], label: tab['label'], selectedIcon: tab['selected']);
        }).toList(),
        trailingAtBottom: true,
        trailing: ListTile(onTap: () {}, minTileHeight: 60, title: Text('data')),
      ),
    );
  }
}
