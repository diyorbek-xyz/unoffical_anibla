import 'package:application/main/views/animes.dart';
import 'package:application/main/views/home.dart';
import 'package:application/widgets/layout/sidebar.dart';
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
      drawer: WidgetSidebar(selectedIndex: _selectedIndex, onDestinationSelected: _onDestinationSelected),
      appBar: AppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeView(),
          AnimesView(),
          Container(color: Colors.blue),
          Container(color: Colors.green),
        ],
      ),
    );
  }
}
