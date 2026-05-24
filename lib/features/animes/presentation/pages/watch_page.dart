import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:application/features/player/presentation/widgets/video_controls.dart';
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
    final state = context.read<EpisodeBloc>().state;
    if (state is EpisodeSuccess) {
      final episode = state.episodes.firstWhere((e) => e.episodeNumber == widget.episode);
      final PlaylistPosition pos = widget.episode == 1
          ? .first
          : widget.episode == state.episodes.length
          ? .last
          : .middle;
      await controller.init(PlayerProps(position: pos, type: widget.type, title: episode.episodeNumber.toString(), stream: episode.video));
    }
  }

  Future<void> initMovie() async {
    final state = context.read<AnimeBloc>().state;
    if (state is AnimeSuccess) {
      await controller.init(PlayerProps(position: .none, type: widget.type, title: state.anime.title.uz, stream: state.anime.video));
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
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocListener(
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
        child: BlocSelector<PlayerController, PlayerStates, bool>(
          selector: (state) => state.hasError,
          builder: (context, state) {
            if (state) return Container(color: Colors.black, alignment: .center, child: CircularProgressIndicator());
            return VideoPlayer();
          },
        ),
      ),
    );
  }
}
