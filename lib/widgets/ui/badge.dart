import 'package:application/constants/colors.dart';
import 'package:flutter/material.dart';

class WidgetBage extends StatelessWidget {
  final String text;
  const WidgetBage({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: Text(text, style: TextStyle(fontSize: 15, color: primaryDark)),
    );
  }
}
