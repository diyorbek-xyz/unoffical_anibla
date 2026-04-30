import 'package:application/features/main/presentation/widgets/bottom_bar.dart';
import 'package:application/features/main/presentation/widgets/sidebar.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell shell;
  const MainPage({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sidebar = Sidebar(shell: shell);
        final isMobile = constraints.maxWidth < MOBILE_WIDTH + sidebar.width;
        final body = isMobile
            ? shell
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  sidebar,
                  Expanded(child: shell),
                ],
              );
        return Scaffold(
          body: body,
          bottomNavigationBar: isMobile ? BottomBar(shell: shell) : null,
        );
      },
    );
  }
}
