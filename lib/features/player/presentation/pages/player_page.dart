import 'package:application/features/animes/presentation/widgets/video_player.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  final VideoPlayer player;
  const PlayerPage({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: player);
  }
}
