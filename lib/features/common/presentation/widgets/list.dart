import 'package:application/core/config/theme/app_colors.dart';
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
  const ListBorderRadius({
    this.outerRadius = const Radius.circular(15),
    this.innerRadius = const Radius.circular(5),
  });

  BorderRadiusGeometry get first => BorderRadiusGeometry.only(
    topLeft: outerRadius,
    topRight: outerRadius,
    bottomLeft: innerRadius,
    bottomRight: innerRadius,
  );
  BorderRadiusGeometry get middle => BorderRadiusGeometry.all(innerRadius);
  BorderRadiusGeometry get last => BorderRadiusGeometry.only(
    topLeft: innerRadius,
    topRight: innerRadius,
    bottomLeft: outerRadius,
    bottomRight: outerRadius,
  );
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
  const ListsWidget({
    super.key,
    this.spacing = 2,
    this.borderRadius = const ListBorderRadius(),
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: items.length,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: spacing),
      itemBuilder: (context, index) {
        final list = items[index];
        return ListWidget(item: list, borderRadius: borderRadius.fromIndex(index, items.length));
      },
    );
  }
}

class ListWidget extends StatelessWidget {
  final ListModel item;
  final BorderRadiusGeometry borderRadius;
  const ListWidget({super.key, required this.item, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.appColors.primaryContainer,
      textColor: context.appColors.primaryFixed,
      iconColor: context.appColors.primaryFixed,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 18),
      leading: Padding(padding: EdgeInsetsGeometry.only(right: 5), child: Icon(item.icon)),
      title: Text(item.label),
      onTap: () {},
      subtitle: Text(item.value, style: TextStyle(color: context.appColors.primaryFixedDim)),
      trailing: (item.actions != null && item.actions!.isNotEmpty)
          ? Row(mainAxisSize: MainAxisSize.min, children: item.actions!)
          : null,
    );
  }
}
