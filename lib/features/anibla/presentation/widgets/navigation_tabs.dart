import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/domain/entities/tab_item.dart';
import 'package:flutter/material.dart';

class NavigationTabs extends StatelessWidget {
  final List<TabItem> tabs;
  final int selectedIndex;
  final void Function(int index) onTabSelected;
  const NavigationTabs({super.key, required this.tabs, required this.selectedIndex, required this.onTabSelected});

  static Widget sliver({required List<TabItem> tabs, required int selectedIndex, required void Function(int index) onTabSelected}) =>
      SliverList.separated(
        addRepaintBoundaries: true,
        itemCount: tabs.length,
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemBuilder: (c, i) => itemBuilder(context: c, tab: tabs[i], isSelected: i == selectedIndex, onTabSelected: () => onTabSelected(i)),
      );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      addRepaintBoundaries: true,
      shrinkWrap: true,
      itemCount: tabs.length,
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemBuilder: (c, i) => itemBuilder(context: c, tab: tabs[i], isSelected: i == selectedIndex, onTabSelected: () => onTabSelected(i)),
    );
  }

  static Widget itemBuilder({required BuildContext context, required TabItem tab, required bool isSelected, required void Function() onTabSelected}) {
    return ListTile(
      title: Text(tab.label),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(100)),
      onTap: onTabSelected,
      tileColor: Colors.transparent,
      selected: isSelected,
      selectedTileColor: context.appColors.primaryFixed.withValues(alpha: 0.1),
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 11),
      leading: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected ? context.appColors.primary : context.appColors.onPrimary,
        ),
        padding: EdgeInsets.all(10),
        child: Icon(tab.icon, color: isSelected ? context.appColors.onPrimary : context.appColors.primary),
      ),
    );
  }
}
