import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/widgets/video_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit_video/media_kit_video.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PlayerController>();
    return Scaffold(
      body: Video(controller: controller.controller, controls: (state) => VideoControls()),
    );
  }
}
