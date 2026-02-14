import 'package:flutter/material.dart';

class WigetNavigationRail extends StatefulWidget {
  const WigetNavigationRail({super.key});

  @override
  State<WigetNavigationRail> createState() => _WigetNavigationRailState();
}

class _WigetNavigationRailState extends State<WigetNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: 0,
      destinations: [NavigationRailDestination(icon: Icon(Icons.abc), label: Text('data'))],
    );
  }
}
