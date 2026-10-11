import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class BackIntent extends Intent {
  const BackIntent();
}

class KeyboardShortcuts extends StatelessWidget {
  final Widget child;
  final GoRouter router;
  const KeyboardShortcuts(this.router, this.child, {super.key});

  @override
  Widget build(_) => Shortcuts(
    shortcuts: const {SingleActivator(LogicalKeyboardKey.escape): BackIntent()},
    child: Actions(
      actions: {
        BackIntent: CallbackAction<BackIntent>(
          onInvoke: (_) {
            if (router.canPop()) router.pop();
            return null;
          },
        ),
      },
      child: Focus(autofocus: true, child: child),
    ),
  );
}
