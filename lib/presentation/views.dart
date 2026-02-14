import 'package:application/core/constants/tabs.dart';
import 'package:application/presentation/views/animes.dart';
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
    return Scaffold(
      drawer: _sideBar(false),
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            AnimesView(),
            Text("home"),
            Text("search"),
            Container(color: Colors.green),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onDestinationSelected,
        selectedIndex: _selectedIndex,
        destinations: tabs
            .map((tab) => NavigationDestination(icon: tab['icon'], label: tab['label'], selectedIcon: tab['selected']))
            .toList(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(title: Row(children: [Image.asset('assets/images/logo.png')]));
  }

  Widget _sideBar(bool expanded) {
    return NavigationDrawer(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onDestinationSelected,
      children: tabs
          .map((tab) => NavigationDrawerDestination(icon: tab['icon'], label: Text(tab['label']), selectedIcon: tab['selected']))
          .toList(),
    );
  }
}
