import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  final StatefulNavigationShell shell;
  const BottomBar({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Material(
        child: Row(
          children: [
            Row(
              children: [
                Column(children: [Icon(Icons.abc), Text("Menu")]),
                Column(children: [Icon(Icons.abc), Text("Menu")]),
                Column(children: [Icon(Icons.abc), Text("Menu")]),
                Column(children: [Icon(Icons.abc), Text("Menu")]),
              ],
            ),
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.book)),
          ],
        ),
      ),
    );
    // return NavigationBar(
    //   onDestinationSelected: (index) {
    //     shell.goBranch(index, initialLocation: index == shell.currentIndex);
    //   },
    //   selectedIndex: shell.currentIndex,
    //   maintainBottomViewPadding: false,
    //   destinations: mobileTabs
    //       .map(
    //         (e) => NavigationDestination(tooltip: e.label, icon: Icon(e.icon), label: e.label, selectedIcon: Icon(e.activeIcon)),
    //       )
    //       .toList(),
    // );
  }
}
