import 'dart:async';
import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/player/data/model/player_props.dart';
import 'package:application/features/player/presentation/controller/player_controller.dart';
import 'package:application/features/player/presentation/widgets/video_player.dart';
import 'package:application/features/polished/presentation/controller/media_controller.dart';
import 'package:application/features/polished/view_models/media/chapter_view.dart';
import 'package:application/features/polished/view_models/media/media_view.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_flutter/signals_core.dart';

class WatchPage extends StatefulWidget {
  final MediaProps props;
  const WatchPage(this.props, {super.key});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  late final _mediaController = sl<MediaController>();
  late final _playerController = sl<PlayerController>();
  late final EffectCleanup _cleanup;

  Future<void> initialize() async {
    await _mediaController.getFullMedia(widget.props);
    final anime = _mediaController.media.data;
    final episodes = _mediaController.chapters.data;
    if (episodes == null || episodes.isEmpty || anime == null) return;
    if (widget.props.type.isSerie) {
      final episode = episodes.firstWhere((e) => e.key == widget.props.chapterKey, orElse: () => episodes.first);
      await initSerie(anime, episode);
    }
    if (widget.props.type.isMovie) {
      await initMovie(anime);
    }
  }

  Future<void> initSerie(MediaView anime, ChapterView episode) async => await _playerController.init(
    MediaStream(
      type: MediaType.serie,
      cover: anime.cover,
      animeTitle: anime.title,
      episodeTitle: episode.title,
      url: episode.mediaUrl,
      episode: episode.offset,
      totalEpisodes: episode.total,
    ),
  );

  Future<void> initMovie(MediaView anime) async => await _playerController.init(
    MediaStream(
      episode: 0,
      totalEpisodes: 0,
      cover: anime.cover,
      url: anime.mediaUrl,
      type: MediaType.movie,
      animeTitle: anime.title,
      episodeTitle: anime.title,
    ),
  );

  @override
  void initState() {
    super.initState();
    _cleanup = effect(initialize);
  }

  @override
  void dispose() {
    _cleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(isPage: true);
  }
}
