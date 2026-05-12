import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/network/errors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorBuilder extends StatelessWidget {
  final String message;
  final void Function() refresh;
  const ErrorBuilder({super.key, required this.message, required this.refresh});

  @override
  Widget build(BuildContext context) {
    if (message == ErrorMessages.unauthorized) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            ElevatedButton(
              onPressed: () => context.pushNamed("login"),
              child: Text("Kirish"),
            ),
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(message, style: context.textTheme.headlineSmall),
        Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            ElevatedButton.icon(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back),
              label: Text("Chiqish"),
            ),
            ElevatedButton.icon(
              onPressed: refresh,
              icon: Icon(Icons.refresh),
              label: Text("Yangilash"),
            ),
          ],
        ),
      ],
    );
  }
}
