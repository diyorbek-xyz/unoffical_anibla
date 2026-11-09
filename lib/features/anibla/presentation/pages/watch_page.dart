import 'dart:developer';

import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/features/player/data/model/player_props.dart';
import 'package:application/features/player/presentation/controller/player_controller.dart';
import 'package:application/features/player/presentation/widgets/video_player.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/interactions/error_messenger.dart';
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
  late final PlayerController _playerController;
  late final MediaController _mediaController;
  late final EffectCleanup _cleanup;

  dynamic initialize() {
    final animeState = _mediaController.animeState;
    final seasonsState = _mediaController.seasonsState;
    final episodesState = _mediaController.episodesState;
    final error = animeState.error ?? seasonsState.error ?? episodesState.error;
    if (animeState.isLoading || seasonsState.isLoading || episodesState.isLoading) return;
    if (animeState.hasError || seasonsState.hasError || episodesState.hasError)
      return showErrorSnackbar(context, error ?? "Xatolik");
    final anime = animeState.data;
    final seasons = seasonsState.data;
    final episodes = episodesState.data;
    log("init", zone: .current);
    if (anime == null || (widget.props.type.isSerie && (seasons == null || episodes == null))) return fetchData();
    if (anime.slug != widget.props.mediaKey) return fetchData();
    if (_playerController.stream?.animeTitle == anime.title.uz) return;
    if (widget.props.type.isMovie) initMovie(anime);
    if (widget.props.type.isSerie) initSerie(anime);
  }

  Future<void> fetchData() async {
    final animeState = _mediaController.animeState.value;
    if (!animeState.isLoading && !animeState.hasError) {
      log("fetch");
      await _mediaController.getFullAnime(widget.props.type, widget.props.mediaKey);
    }
  }

  Future<void> initSerie(Anime anime) async {
    final episodes = _mediaController.episodesState.data;
    if (episodes == null || episodes.isEmpty) return;
    final episode = episodes.firstWhere((e) => e.id == widget.props.chapterKey, orElse: () => episodes.first);
    final props = MediaStream(
      type: MediaType.serie,
      cover: anime.cover,
      animeTitle: anime.title.uz,
      episodeTitle: episode.title.uz,
      totalEpisodes: episodes.length,
      url: episode.video,
      episode: episode.episodeNumber,
    );
    await _playerController.init(props);
  }

  Future<void> initMovie(Anime anime) async {
    final props = MediaStream(
      episode: 0,
      totalEpisodes: 0,
      animeTitle: anime.title.uz,
      episodeTitle: anime.title.uz,
      cover: anime.cover,
      url: anime.video,
      type: MediaType.movie,
    );
    await _playerController.init(props);
  }

  @override
  void initState() {
    super.initState();
    _playerController = sl<PlayerController>();
    _mediaController = sl<MediaController>();
    _cleanup = effect(initialize);
  }

  @override
  void dispose() {
    _cleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => VideoPlayer(isPage: true);
}
