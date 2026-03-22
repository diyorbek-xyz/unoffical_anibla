import 'package:application/features/home/presentation/pages/home_page.dart';
import 'package:application/features/home/presentation/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  List<Widget> pages = [HomePage(), Text("Hello"), Text("World"), Text("Profile")];

  void setIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Sidebar(index: _index, setIndex: setIndex),
          Expanded(
            child: IndexedStack(index: _index, children: pages),
          ),
        ],
      ),
      // bottomNavigationBar: BottomBar(index: _index, setIndex: setIndex),
    );
  }
}
