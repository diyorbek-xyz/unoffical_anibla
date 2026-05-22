import 'package:application/features/player/presentation/widgets/video_controls.dart';
import 'package:flutter/material.dart';

class WatchPage extends StatefulWidget {
  final String slug;
  final String type;
  final int episode;
  const WatchPage({super.key, required this.slug, required this.type, required this.episode});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VideoPlayer()
    );
  }
}
