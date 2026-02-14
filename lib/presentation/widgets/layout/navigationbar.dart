import 'package:flutter/material.dart';

class WidgetNavigationBar extends StatelessWidget {
  final void Function(int) onDestinationSelected;
  final int selectedIndex;
  const WidgetNavigationBar({super.key, required this.onDestinationSelected, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      selectedIndex: selectedIndex,
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.search), label: "Search"),
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.people_alt_outlined), label: "Profile"),
      ],
    );
  }
}
