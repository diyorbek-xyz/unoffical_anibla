import 'package:application/presentation/views/animes.dart';
import 'package:application/presentation/widgets/layout/sidebar.dart';
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
      appBar: AppBar(title: Row(children: [Image.asset('assets/images/logo.png')])),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          AnimesView(),
          Text("home"),
          Text("search"),
          Container(color: Colors.green),
        ],
      ),
      // bottomNavigationBar: WidgetNavigationBar(onDestinationSelected: _onDestinationSelected, selectedIndex: _selectedIndex),
    );
  }
}
