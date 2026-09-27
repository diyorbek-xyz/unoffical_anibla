import 'package:flutter/widgets.dart';

class TabItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String path;
  const TabItem({required this.activeIcon, required this.icon, required this.label, this.path = ""});
}
