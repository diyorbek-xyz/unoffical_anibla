import 'package:application/core/constants/icons.dart';
import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  final String platform;
  const PlatformWidget({super.key, required this.platform});

  @override
  Widget build(BuildContext context) {
    switch (platform) {
      case "android":
        return Icon(MyIcons.android);
      case "ios":
        return Icon(MyIcons.apple);
      default:
        return Icon(Icons.android);
    }
  }
}
