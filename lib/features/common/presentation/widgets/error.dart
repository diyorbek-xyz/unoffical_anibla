import 'package:flutter/material.dart';

class ErrorBuilder extends StatelessWidget {
  final String message;
  final void Function() refresh;
  const ErrorBuilder({super.key, required this.message, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(message),
        ElevatedButton(
          onPressed: refresh,
          child: Text("Yangilash"),
        ),
      ],
    );
  }
}
