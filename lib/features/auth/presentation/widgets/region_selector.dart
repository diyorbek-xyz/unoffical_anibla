import 'package:flutter/material.dart';

class Region {
  final String name;
  final int code;
  const Region({required this.code, required this.name});

  @override
  String toString() => "$name +$code";
}

final List<Region> regions = [Region(code: 998, name: "Uzbekistan")];

class RegionSelector extends StatefulWidget {
  final void Function(Region reg) changeRegion;
  final Region current;
  const RegionSelector({super.key, required this.changeRegion, required this.current});

  @override
  State<RegionSelector> createState() => _RegionSelectorState();
}

class _RegionSelectorState extends State<RegionSelector> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Text("+${widget.current.code}"),
      itemBuilder: (context) => regions.map((e) => PopupMenuItem(onTap: () => widget.changeRegion(e), child: Text(e.toString()))).toList(),
    );
  }
}
