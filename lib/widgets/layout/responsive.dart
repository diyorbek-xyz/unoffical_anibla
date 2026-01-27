import 'package:flutter/material.dart';

class ResponsiveOrientation extends StatelessWidget {
  final List<Widget> children;
  final int maxWidth;
  const ResponsiveOrientation({super.key, required this.children, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < maxWidth) {
          return Column(mainAxisSize: MainAxisSize.min, children: children.map((c) => c is Expanded ? c.child : c).toList());
        } else {
          return Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: 10, children: children);
        }
      },
    );
  }
}
