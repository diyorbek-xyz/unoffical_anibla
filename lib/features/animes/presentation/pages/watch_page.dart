import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/widgets/episodes_list.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:application/features/player/presentation/widgets/video_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit_video/media_kit_video.dart';

class WatchPage extends StatefulWidget {
  final String slug;
  final String type;
  final int episode;
  const WatchPage({super.key, required this.slug, required this.type, required this.episode});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  late PlayerController controller;

  @override
  void initState() {
    controller = context.read<PlayerController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AnimeBloc, AnimeState>(
        builder: (context, state) {
          switch (state) {
            case AnimeLoading():
              return Center(child: CircularProgressIndicator());
            case AnimeFilure():
              return Center(child: Text(state.message));
            case AnimeSuccess():
              final isMobile = MediaQuery.of(context).size.width < 900;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 16),
                      height: isMobile ? 400 : 500,
                      child: isMobile
                          ? player
                          : Row(
                              children: [
                                Expanded(flex: 10, child: player),
                                Expanded(flex: 5, child: EpisodesList()),
                              ],
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 50, top: 20),
                        constraints: BoxConstraints(maxWidth: 1100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: .max,
                          spacing: 10,
                          children: [
                            Text(state.anime.title.uz, style: context.textTheme.headlineMedium),
                            Text(state.anime.description.uz, style: context.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            default:
              return Text("Nimadur xato ketti");
          }
        },
      ),
    );
  }

  Widget get player => BlocSelector<PlayerController, PlayerStates, BoxFit>(
    selector: (state) => state.fit,
    builder: (context, fit) {
      return RepaintBoundary(
        child: Video(controller: controller.controller, fit: fit, controls: (_) => VideoControls()),
      );
    },
  );
}
