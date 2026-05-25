import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:flutter/material.dart';

enum ListPosition {
  first,
  middle,
  last;

  factory ListPosition.fromIndexex({required int current, required int all}) {
    if (current == all - 1) return ListPosition.last;
    if (current == 0) return ListPosition.first;
    return ListPosition.middle;
  }
}

class ListBorderRadius {
  final Radius outerRadius;
  final Radius innerRadius;
  const ListBorderRadius({this.outerRadius = const Radius.circular(15), this.innerRadius = const Radius.circular(5)});

  BorderRadiusGeometry get first =>
      BorderRadiusGeometry.only(topLeft: outerRadius, topRight: outerRadius, bottomLeft: innerRadius, bottomRight: innerRadius);
  BorderRadiusGeometry get middle => BorderRadiusGeometry.all(innerRadius);
  BorderRadiusGeometry get last =>
      BorderRadiusGeometry.only(topLeft: innerRadius, topRight: innerRadius, bottomLeft: outerRadius, bottomRight: outerRadius);
  BorderRadiusGeometry get single => BorderRadiusGeometry.all(outerRadius);
  BorderRadiusGeometry fromPosition(ListPosition position) {
    switch (position) {
      case ListPosition.first:
        return first;
      case ListPosition.middle:
        return middle;
      case ListPosition.last:
        return last;
    }
  }

  BorderRadiusGeometry fromIndex(int current, int all) {
    if (all == 1) return single;
    if (current == all - 1) return last;
    if (current == 0) return first;
    return middle;
  }
}

class ListModel {
  final String label;
  final String value;
  final IconData icon;
  final List<Widget>? actions;
  const ListModel({this.actions, required this.icon, required this.label, required this.value});
}

class ListsWidget extends StatelessWidget {
  final List<ListModel> items;
  final double spacing;
  final ListBorderRadius borderRadius;
  const ListsWidget({super.key, this.spacing = 2, this.borderRadius = const ListBorderRadius(), required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 1.5,
      crossAxisAlignment: .start,
      mainAxisAlignment: .start,
      mainAxisSize: .min,
      children: items.asMap().entries.map((e) {
        final index = e.key;
        final list = items[index];
        final responsive = Responsive.of(context);
        if (responsive.isMobile) {
          return ListTile(
            textColor: context.appColors.primaryFixed,
            iconColor: context.appColors.primaryFixed,
            contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 18),
            leading: Padding(padding: EdgeInsetsGeometry.only(right: 5), child: Icon(list.icon)),
            title: Text(list.label),
            onTap: () {},
            subtitle: Text(list.value, style: TextStyle(color: context.appColors.primaryFixedDim)),
            trailing: (list.actions != null && list.actions!.isNotEmpty) ? Row(mainAxisSize: MainAxisSize.min, children: list.actions!) : null,
          );
        }
        return ListTile(
          tileColor: context.appColors.primaryContainer,
          textColor: context.appColors.primaryFixed,
          iconColor: context.appColors.primaryFixed,
          shape: RoundedRectangleBorder(borderRadius: borderRadius.fromIndex(index, items.length)),
          contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 18),
          leading: Padding(padding: EdgeInsetsGeometry.only(right: 5), child: Icon(list.icon)),
          title: Text(list.label),
          onTap: () {},
          subtitle: Text(list.value, style: TextStyle(color: context.appColors.primaryFixedDim)),
          trailing: (list.actions != null && list.actions!.isNotEmpty) ? Row(mainAxisSize: MainAxisSize.min, children: list.actions!) : null,
        );
      }).toList(),
    );
  }
}
