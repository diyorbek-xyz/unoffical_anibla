import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:application/features/player/presentation/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Future<void> initEpisode() async {
    final anime = context.read<AnimeBloc>().state;
    final state = context.read<EpisodeBloc>().state;
    if (state is EpisodeSuccess && anime is AnimeSuccess) {
      final episode = state.episodes.firstWhere((e) => e.episodeNumber == widget.episode);
      final PlaylistPosition pos = widget.episode == 1
          ? .first
          : widget.episode == state.episodes.length
          ? .last
          : .middle;
      await controller.init(
        PlayerProps(
          anime: anime.anime.title.uz,
          cover: anime.anime.cover,
          position: pos,
          type: widget.type,
          title: episode.episodeNumber.toString(),
          stream: episode.video,
        ),
      );
    }
  }

  Future<void> initMovie() async {
    final state = context.read<AnimeBloc>().state;
    if (state is AnimeSuccess) {
      await controller.init(
        PlayerProps(
          anime: state.anime.title.uz,
          position: .none,
          cover: state.anime.cover,
          type: widget.type,
          title: state.anime.title.uz,
          stream: state.anime.video,
        ),
      );
    }
  }

  @override
  void initState() {
    controller = context.read<PlayerController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.type == AnimeType.movie) {
        initMovie();
      } else {
        initEpisode();
      }
    });
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
      child: BlocSelector<PlayerController, PlayerStates, (String?, bool)>(
        selector: (state) => (state.error, state.hasError),
        builder: (context, state) {
          if (state.$2) {
            final error = state.$1 == "paid" ? "Bu animeni ko'rish uchun obuna sotib olding" : "";
            return Container(color: Colors.black, alignment: .center, child: Text(error));
          }
          return VideoPlayer(isPage: true);
        },
      ),
    );
  }
}
