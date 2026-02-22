import 'package:application/core/constants/tabs.dart';
import 'package:application/presentation/pages/home.dart';
import 'package:application/presentation/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    final width = MediaQuery.of(context).size.width;
    final stack = IndexedStack(
      index: _selectedIndex,
      children: [
        HomePage(),
        SearchPage(),
        TextButton(onPressed: () => context.pushNamed("login"), child: Text("Login")),
        Container(color: Colors.green),
      ],
    );
    return SafeArea(
      child: Scaffold(
        drawer: width < 800 ? null : _drawer(),
        bottomNavigationBar: width < 800 ? _navBar() : null,
        drawerEdgeDragWidth: 10,
        body: Row(
          children: [
            width > 800 ? _navRail() : Container(),
            Expanded(child: stack),
          ],
        ),
      ),
    );
  }

  NavigationBar _navBar() {
    return NavigationBar(
      onDestinationSelected: _onDestinationSelected,
      selectedIndex: _selectedIndex,
      destinations: tabs
          .map((tab) => NavigationDestination(icon: tab['icon'], label: tab['label'], selectedIcon: tab['selected']))
          .toList(),
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

  Widget _navRail() {
    return SizedBox(
      width: 100,
      child: Builder(
        builder: (context) {
          return NavigationRail(
            elevation: 10,
            labelType: NavigationRailLabelType.all,
            leading: IconButton(onPressed: () => Scaffold.of(context).openDrawer(), icon: Icon(Icons.menu)),
            destinations: tabs
                .map((e) => NavigationRailDestination(icon: e['icon'], label: Text(e['label']), selectedIcon: e['selected']))
                .toList(),
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onDestinationSelected,
          );
        },
      ),
    );
  }
}
