import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/network/resources/errors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorBuilder extends StatelessWidget {
  final String message;
  final void Function() refresh;
  final BuildContext? context;
  final bool hasExit;
  const ErrorBuilder({super.key, required this.message, required this.refresh, this.context, this.hasExit = false});

  @override
  Widget build(BuildContext error) {
    if (message == ErrorMessages.unauthorized) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            ElevatedButton(onPressed: () => (context ?? error).pushNamed("login"), child: Text("Kirish")),
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(message, style: error.textTheme.headlineSmall),
        hasExit
            ? Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => (context ?? error).pop(),
                    icon: Icon(Icons.arrow_back),
                    label: Text("Chiqish"),
                  ),
                  ElevatedButton.icon(onPressed: refresh, icon: Icon(Icons.refresh), label: Text("Yangilash")),
                ],
              )
            : ElevatedButton.icon(onPressed: refresh, icon: Icon(Icons.refresh), label: Text("Yangilash")),
      ],
    );
  }
}
