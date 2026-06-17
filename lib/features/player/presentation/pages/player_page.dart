import 'package:application/features/player/presentation/widgets/video_player.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(isFullscreen: true);
  }
}
