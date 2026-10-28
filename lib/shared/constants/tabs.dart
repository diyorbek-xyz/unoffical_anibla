import 'package:application/features/view/models/tab_view.dart';
import 'package:flutter/material.dart';

const List<TabItem> mobileTabs = [
  TabItem(activeIcon: Icons.movie, icon: Icons.movie_outlined, label: "Animelar"),
  TabItem(activeIcon: Icons.book, icon: Icons.book_outlined, label: "Kitoblar"),
  TabItem(activeIcon: Icons.search, icon: Icons.search, label: "Qidirish"),
  TabItem(activeIcon: Icons.download, icon: Icons.download_outlined, label: "Yuklanganlar"),
  TabItem(activeIcon: Icons.account_circle, icon: Icons.account_circle_outlined, label: "Profile"),
];

const List<TabItem> desktopTabs = [
  TabItem(activeIcon: Icons.movie, icon: Icons.movie_outlined, label: "Animelar"),
  TabItem(activeIcon: Icons.book, icon: Icons.book_outlined, label: "Kitoblar"),
  TabItem(activeIcon: Icons.search, icon: Icons.search, label: "Qidirish"),
  TabItem(activeIcon: Icons.download, icon: Icons.download_outlined, label: "Yuklanganlar"),
  TabItem(activeIcon: Icons.account_circle, icon: Icons.account_circle_outlined, label: "Profile"),
];
