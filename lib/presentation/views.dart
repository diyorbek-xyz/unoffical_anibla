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
          drawer: _drawer(),
          drawerEdgeDragWidth: 10,
          body: Row(
            children: [
              SizedBox(width: 100, child: _navRail()),
              Expanded(flex: 5, child: stack),
            ],
          ),
        );
      },
    );
  }

  Widget _drawer() {
    return Drawer(
      child: NavigationDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        header: UserAccountsDrawerHeader(
          accountName: Text("Account"),
          accountEmail: Text("Emial"),
          currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/images/avatar.png")),
        ),
        children: tabs
            .map((tab) => NavigationDrawerDestination(icon: tab['icon'], label: Text(tab['label']), selectedIcon: tab['selected']))
            .toList(),
      ),
    );
  }

  Builder _navRail() {
    return Builder(
      builder: (context) {
        return NavigationRail(
          elevation: 10,
          labelType: NavigationRailLabelType.all,
          leading: IconButton(onPressed: () => Scaffold.of(context).openDrawer(), icon: Icon(Icons.menu)),
          destinations: tabs.map((e) => NavigationRailDestination(icon: e['icon'], label: Text(e['label']))).toList(),
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
        );
      },
    );
  }
}
