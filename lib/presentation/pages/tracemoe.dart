import 'package:flutter/material.dart';

class TraceMoePage extends StatefulWidget {
  const TraceMoePage({super.key});

  @override
  State<TraceMoePage> createState() => _TraceMoeStatePage();
}

class _TraceMoeStatePage extends State<TraceMoePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text("Search by image"));
  }
}
