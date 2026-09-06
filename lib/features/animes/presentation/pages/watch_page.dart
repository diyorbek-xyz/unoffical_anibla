import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/models/page_props.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/controller/anime_controller.dart';
import 'package:application/features/player/presentation/cubit/player/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player/player_states.dart';
import 'package:application/features/player/presentation/widgets/video_player.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signals_flutter/signals_core.dart';

class WatchPage extends StatefulWidget {
  final AnimePageProps props;
  const WatchPage({super.key, required this.props});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  late final AnimeController _animeController;
  late final EffectCleanup _cleanup;
  late PlayerController controller;

  EffectCleanup signalListener() => effect(() {
    final anime = _animeController.mediaState.value.value;
    final seasons = _animeController.seasonsState.value.value;
    final episodes = _animeController.episodesState.value.value;
    if (anime == null || seasons == null || episodes == null) return;
    if (widget.props.animeType.isMovie) {
      initMovie(anime);
    } else {
      initEpisode(anime);
    }
  });

  void fetchData() async {
    final animeState = _animeController.mediaState.value;
    if (!animeState.isLoading && !animeState.hasValue && !animeState.hasError) {
      await _animeController.getFullAnime(widget.props.animeType, widget.props.animeSlug);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = context.read<PlayerController>();
    _animeController = sl<AnimeController>();
    _cleanup = signalListener();
    fetchData();
  }

  @override
  void dispose() {
    _cleanup();
    super.dispose();
  }

  Future<void> initEpisode(AnimeEntity anime) async {
    final episodes = _animeController.episodesState.value.value;
    if (episodes == null || episodes.isEmpty) return;
    final episode = episodes.firstWhere((e) => e.slug == widget.props.episodeSlug, orElse: () => episodes.first);
    final props = PlayerProps(
      cover: anime.cover,
      anime: anime.title.uz,
      title: episode.title.uz,
      type: AnimeType.serie,
      all: episodes.length,
      offset: episode.episodeNumber,
      stream: widget.props.localPath ?? episode.video,
      hasUrl: widget.props.localPath != null,
    );
    if (controller.state.status == .empty) await controller.init(props);
    if (controller.state.status != .empty && widget.props.episodeSlug != null) await controller.openStream(props);
  }

  Future<void> initMovie(AnimeEntity anime) async {
    final props = PlayerProps(
      offset: 0,
      all: 0,
      anime: anime.title.uz,
      cover: anime.cover,
      type: AnimeType.movie,
      title: anime.title.uz,
      stream: widget.props.localPath ?? anime.video,
      hasUrl: widget.props.localPath != null,
    );
    if (controller.state.status == .empty) await controller.init(props);
    if (controller.state.status != .empty) await controller.openStream(props);
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(isPage: true);
  }
}
