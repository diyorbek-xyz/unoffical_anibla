import 'package:application/core/constants/tabs.dart';
import 'package:application/presentation/pages/home.dart';
import 'package:flutter/material.dart';

class Views extends StatefulWidget {
  const Views({super.key});
  @override
  State<StatefulWidget> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  int _selectedIndex = 0;
  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final stack = IndexedStack(
          index: _selectedIndex,
          children: [
            HomePage(),
            Text("home"),
            Text("search"),
            Container(color: Colors.green),
          ],
        );
        if (constraints.maxWidth < 800) {
          return Scaffold(
            body: stack,
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: _onDestinationSelected,
              selectedIndex: _selectedIndex,
              destinations: tabs
                  .map((tab) => NavigationDestination(icon: tab['icon'], label: tab['label'], selectedIcon: tab['selected']))
                  .toList(),
            ),
          );
        }
        return Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: .start,
            children: [
              Expanded(flex: 2, child: _sideBar(false)),
              Expanded(flex: 8, child: stack),
            ],
          ),
        );
      },
    );
  }

  Widget _sideBar(bool expanded) {
    return NavigationDrawer(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onDestinationSelected,
      header: Container(
        height: 100,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20),
        child: Image.asset('assets/images/logo.png', scale: 0.8),
      ),
      children: tabs
          .map((tab) => NavigationDrawerDestination(icon: tab['icon'], label: Text(tab['label']), selectedIcon: tab['selected']))
          .toList(),
    );
  }
}
