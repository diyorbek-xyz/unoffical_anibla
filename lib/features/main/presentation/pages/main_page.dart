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
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < MOBILE_WIDTH;
    return Scaffold(
      body: !isMobile
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Sidebar(shell: shell),
                Expanded(child: shell),
              ],
            )
          : shell,
      bottomNavigationBar: isMobile ? BottomBar(shell: shell) : null,
    );
  }
}
