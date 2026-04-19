import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/url_launcher.dart';
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
  bool expanded = true;
  void setIndex(int index) {
    widget.shell.goBranch(index, initialLocation: index == widget.shell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final double width = 200;
    return NavigationRail(
      trailingAtBottom: true,
      trailing: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .start,
          spacing: 10,
          children: [
            footerLink(
              icon: Icons.telegram,
              label: "Telegram Kanal:",
              linkName: "@AmediaTVuz",
              link: "https://t.me/amediatvuz",
            ),
            footerLink(
              icon: Icons.newspaper,
              label: "Yangiliklar:",
              linkName: "@AniblaNews",
              link: "https://t.me/aniblanews",
            ),
          ],
        ),
      ),
      leading: SizedBox(
        height: 220,
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          spacing: 13,
          children: [
            CircleAvatar(radius: 70, backgroundImage: AssetImage("assets/images/logo_dynamic.jpg")),
            Text(
              "Anibla.uz",
              style: TextStyle(fontSize: context.textTheme.headlineMedium?.fontSize),
            ),
          ],
        ),
      ),
      leadingAtTop: true,
      minExtendedWidth: width,
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

  Column footerLink({required String label, required String linkName, required String link,required IconData icon}) {
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
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: context.textTheme.labelSmall?.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
