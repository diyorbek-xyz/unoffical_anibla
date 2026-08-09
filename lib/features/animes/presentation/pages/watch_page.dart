import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/player/presentation/cubit/player/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player/player_states.dart';
import 'package:application/features/player/presentation/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchPage extends StatefulWidget {
  final String? type;
  final int? episode;
  final String? url;
  const WatchPage({super.key, this.type, this.url, this.episode});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  late PlayerController controller;
  late AnimeBloc anime;
  @override
  void didChangeDependencies() {
    init();
    super.didChangeDependencies();
  }

  Future<void> initEpisode() async {
    final state = context.read<EpisodeBloc>().state;
    final animeState = anime.state;
    if (state is EpisodeSuccess && animeState is AnimeSuccess) {
      final episode = state.episodes.firstWhere((e) => e.episodeNumber == (widget.episode ?? 1));
      final hasUrl = (widget.url != null && widget.url!.isNotEmpty);
      final props = PlayerProps(
        type: AnimeType.serie,
        cover: animeState.anime.cover,
        anime: animeState.anime.title.uz,
        all: state.episodes.length,
        title: episode.title.uz,
        offset: episode.episodeNumber,
        stream: hasUrl ? widget.url! : episode.video,
        hasUrl: hasUrl,
      );
      if (controller.state.status == .empty) {
        await controller.init(props);
      }
      if (controller.state.status != .empty && widget.episode != null) {
        await controller.openStream(props);
      }
    }
  }

  Future<void> initMovie() async {
    final animeState = anime.state;
    if (animeState is AnimeSuccess) {
      final hasUrl = (widget.url != null && widget.url!.isNotEmpty);
      final props = PlayerProps(
        offset: 0,
        all: 0,
        anime: animeState.anime.title.uz,
        cover: animeState.anime.cover,
        type: AnimeType.movie,
        title: animeState.anime.title.uz,
        stream: hasUrl ? widget.url! : animeState.anime.video,
        hasUrl: hasUrl,
      );
      if (controller.state.status == .empty) {
        await controller.init(props);
      }
      if (controller.state.status != .empty) {
        await controller.openStream(props);
      }
    }
  }

  void init() {
    final animeState = anime.state;
    if (animeState is! AnimeSuccess) return;
    if (widget.type == AnimeType.movie.name || animeState.anime.totalEpisodes == 0 || animeState.anime.duration != 0) {
      initMovie();
    } else {
      initEpisode();
    }
  }

  @override
  void initState() {
    controller = context.read<PlayerController>();
    anime = context.read<AnimeBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) => init());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EpisodeBloc, EpisodeState>(
          listenWhen: (previous, current) => previous is! EpisodeSuccess && current is EpisodeSuccess,
          listener: (context, state) => initEpisode(),
        ),
        BlocListener<AnimeBloc, AnimeState>(
          listenWhen: (previous, current) => previous is! AnimeSuccess && current is AnimeSuccess,
          listener: (context, state) => initMovie(),
        ),
      ],
      child: VideoPlayer(isPage: true),
    );
  }
}
