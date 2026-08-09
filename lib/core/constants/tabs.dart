import 'package:application/features/common/domain/entities/tab_item.dart';
import 'package:flutter/material.dart';

const List<TabItem> mobileTabs = [
  TabItem(activeIcon: Icons.home, icon: Icons.home_outlined, label: "Asosiy"),
  TabItem(activeIcon: Icons.search, icon: Icons.search, label: "Qidirish"),
  TabItem(activeIcon: Icons.home, icon: Icons.home_outlined, label: "Saqlanganlar"),
  TabItem(activeIcon: Icons.home, icon: Icons.home_outlined, label: "Profile"),
];

const List<TabItem> desktopTabs = [
  TabItem(activeIcon: Icons.home, icon: Icons.home_outlined, label: "Asosiy"),
  TabItem(activeIcon: Icons.search, icon: Icons.search, label: "Qidirish"),
  TabItem(activeIcon: Icons.download, icon: Icons.download_outlined, label: "Yuklanganlar"),
  TabItem(activeIcon: Icons.account_circle, icon: Icons.account_circle_outlined, label: "Profile"),
  TabItem(activeIcon: Icons.settings, icon: Icons.settings_outlined, label: "Sozlamalar"),
];
