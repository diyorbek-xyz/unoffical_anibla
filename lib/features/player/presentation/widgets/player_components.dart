import 'package:application/features/animes/presentation/controller/anime_controller.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/player/presentation/cubit/player/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player/player_states.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerOverlayControls extends StatelessWidget {
  PlayerOverlayControls({super.key, required this.controller, required this.bufferingIndicator, this.atOverlay = true});

  final PlayerController controller;
  final Widget bufferingIndicator;
  final bool atOverlay;

  final _animeController = sl<AnimeController>();

  @override
  Widget build(BuildContext context) => BlocSelector<PlayerController, PlayerStates, (CurrentStream, int, bool, bool)>(
    selector: (state) => (state.stream, state.all, state.isPaused, state.isBuffering),
    builder: (context, state) {
      final (stream, all, isPaused, isBuffering) = state;
      final offset = stream.offset;
      final hasNext = offset >= 1 && offset < all && offset != 0 && all != 0;
      final hasPrev = offset > 1 && offset <= all && offset != 0 && all != 0;
      final isMobile = Responsive.of(context).isMobile;
      final double iconSize = atOverlay ? 40 : 30;
      final double padding = atOverlay ? 10 : 5;
      final episodes = _animeController.episodesState.value.value ?? [];
      final previous = episodes.where((element) => element.episodeNumber == (offset - 1)).singleOrNull;
      final next = episodes.where((element) => element.episodeNumber == (offset + 1)).singleOrNull;
      return Center(
        child: ((!isMobile && !atOverlay) || (isMobile && atOverlay))
            ? Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                spacing: atOverlay ? 20 : 10,
                children: [
                  Opacity(
                    opacity: hasPrev ? 1 : 0,
                    child: IconButton(
                      onPressed: (hasPrev && previous != null)
                          ? () => controller.openUrl(previous.video, previous.episodeNumber, previous.title.uz)
                          : null,
                      mouseCursor: hasPrev ? SystemMouseCursors.click : .defer,
                      padding: EdgeInsets.all(padding),
                      iconSize: iconSize,
                      icon: Icon(Icons.skip_previous),
                    ),
                  ),
                  atOverlay
                      ? Stack(
                          alignment: .center,
                          fit: .passthrough,
                          children: [
                            bufferingIndicator,
                            IconButton(
                              onPressed: controller.togglePlay,
                              padding: EdgeInsets.all(10),
                              iconSize: 50,
                              isSelected: isPaused,
                              selectedIcon: Icon(Icons.play_arrow),
                              icon: Icon(Icons.pause),
                            ),
                          ],
                        )
                      : IconButton(
                          onPressed: controller.togglePlay,
                          padding: EdgeInsets.all(padding),
                          iconSize: iconSize * 1.3,
                          isSelected: isPaused,
                          selectedIcon: Icon(Icons.play_arrow),
                          icon: Icon(Icons.pause),
                        ),
                  Opacity(
                    opacity: hasNext ? 1 : 0,
                    child: IconButton(
                      onPressed: (hasPrev && next != null) ? () => controller.openUrl(next.video, next.episodeNumber, next.title.uz) : null,
                      mouseCursor: hasNext ? SystemMouseCursors.click : .defer,
                      padding: EdgeInsets.all(padding),
                      iconSize: iconSize,
                      icon: Icon(Icons.skip_next),
                    ),
                  ),
                ],
              )
            : bufferingIndicator,
      );
    },
  );
}
