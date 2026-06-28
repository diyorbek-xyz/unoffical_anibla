import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/constants/tabs.dart';
import 'package:application/core/utils/url_launcher.dart';
import 'package:application/main.dart';
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
  void setIndex(int index) {
    widget.shell.goBranch(index, initialLocation: index == widget.shell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final expanded = MediaQuery.of(context).size.width > (MOBILE_WIDTH + 300);
    return SizedBox(
      width: expanded ? 200 : 70,
      child: NavigationRail(
        leading: !expanded
            ? null
            : SizedBox(
                height: 220,
                child: Column(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .center,
                  spacing: 13,
                  children: [
                    CircleAvatar(radius: 70, backgroundImage: AssetImage("assets/images/logo_dynamic.jpg")),
                    Text("Anibla.uz", style: TextStyle(fontSize: context.textTheme.headlineMedium?.fontSize)),
                  ],
                ),
              ),
        leadingAtTop: true,
        minExtendedWidth: widget.width,
        extended: expanded,
        selectedIndex: widget.shell.currentIndex,
        labelType: expanded ? null : .selected,
        onDestinationSelected: setIndex,
        mainAxisAlignment: expanded ? .start : .center,
        destinations: desktopTabs
            .map(
              (e) => NavigationRailDestination(
                icon: Icon(e.icon),
                label: Text(e.label, textAlign: .center),
                selectedIcon: Icon(e.activeIcon),
              ),
            )
            .toList(),
      ),
    );
  }

  Column footerLink({required String label, required String linkName, required String link, required IconData icon}) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 3,
      children: [
        Row(
          spacing: 5,
          children: [
            Icon(icon, color: Colors.lightBlue),
            Text(label, style: context.textTheme.labelMedium),
          ],
        ),
        InkWell(
          onTap: () => openLink(link),
          child: Text(
            linkName,
            style: TextStyle(color: Colors.lightBlue, fontSize: context.textTheme.labelSmall?.fontSize),
          ),
        ),
      ],
    );
  }
}
