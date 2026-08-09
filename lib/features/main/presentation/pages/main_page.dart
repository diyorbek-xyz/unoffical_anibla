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
        final isMobile = constraints.maxWidth < MOBILE_WIDTH;
        return Scaffold(
          body: isMobile
              ? shell
              : Row(
                  children: [
                    Sidebar(shell: shell),
                    Expanded(child: shell),
                  ],
                ),
          bottomNavigationBar: isMobile ? BottomBar(shell: shell) : null,
        );
      },
    );
  }
}
