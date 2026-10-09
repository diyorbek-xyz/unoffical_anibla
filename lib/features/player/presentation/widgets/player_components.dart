import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/features/player/data/model/player_props.dart';
import 'package:application/features/player/presentation/controller/player_controller.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/responsive.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PlayerOverlayControls extends StatelessWidget {
  PlayerOverlayControls({super.key, required this.bufferingIndicator, this.atOverlay = true});

  final Widget bufferingIndicator;
  final bool atOverlay;

  final _animeController = sl<MediaController>();
  final _playerController = sl<PlayerController>();

  Future<void> openStream(MediaStream stream) => _playerController.init(stream);

  @override
  Widget build(BuildContext context) => Center(
    child: SignalBuilder(
      builder: (context) {
        final state = _playerController;
        final offset = state.offset;
        final all = state.total;
        final isMobile = Responsive.of(context).isMobile;
        final double iconSize = atOverlay ? 40 : 30;
        final double padding = atOverlay ? 10 : 5;
        final episodes = _animeController.episodesState.data ?? [];
        final previous = episodes.getEpisode(offset - 1);
        final next = episodes.getEpisode(offset + 1);
        final future = episodes.getEpisode(offset + 2);
        final hasNext = offset >= 1 && offset < all && offset != 0 && all != 0 && next != null;
        final hasPrev = offset > 1 && offset <= all && offset != 0 && all != 0 && previous != null;
        final prevSteam = hasPrev ? state.stream?.copyEpisode(previous, forCache: future?.video) : null;
        final nextSteam = hasNext ? state.stream?.copyEpisode(next, forCache: future?.video) : null;
        if (!((!isMobile && !atOverlay) || (isMobile && atOverlay))) return bufferingIndicator;
        return Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          spacing: atOverlay ? 20 : 10,
          children: [
            Opacity(
              opacity: hasPrev ? 1 : 0,
              child: IconButton(
                onPressed: hasPrev ? () => openStream(prevSteam!) : null,
                mouseCursor: hasPrev ? SystemMouseCursors.click : .defer,
                padding: EdgeInsets.all(padding),
                iconSize: iconSize,
                icon: Icon(Icons.skip_previous),
              ),
            ),
            if (atOverlay)
              Stack(
                alignment: .center,
                fit: .passthrough,
                children: [
                  bufferingIndicator,
                  IconButton(
                    onPressed: _playerController.togglePlay,
                    padding: EdgeInsets.all(10),
                    iconSize: 50,
                    isSelected: state.isPaused,
                    selectedIcon: Icon(Icons.play_arrow),
                    icon: Icon(Icons.pause),
                  ),
                ],
              ),
            if (!atOverlay)
              IconButton(
                onPressed: _playerController.togglePlay,
                padding: EdgeInsets.all(padding),
                iconSize: iconSize * 1.3,
                isSelected: state.isPaused,
                selectedIcon: Icon(Icons.play_arrow),
                icon: Icon(Icons.pause),
              ),
            Opacity(
              opacity: hasNext ? 1 : 0,
              child: IconButton(
                onPressed: hasNext ? () => openStream(nextSteam!) : null,
                mouseCursor: hasNext ? SystemMouseCursors.click : .defer,
                padding: EdgeInsets.all(padding),
                iconSize: iconSize,
                icon: Icon(Icons.skip_next),
              ),
            ),
          ],
        );
      },
    ),
  );
}
