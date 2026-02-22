import 'package:application/core/constants/theme.dart';
import 'package:flutter/material.dart';

class WidgetBadge extends StatelessWidget {
  final String text;
  const WidgetBadge({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: Text(text, style: TextStyle(fontSize: 15, color: primaryDark)),
    );
  }
}
