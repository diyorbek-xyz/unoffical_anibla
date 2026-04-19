import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/bloc/video/video_bloc.dart';
import 'package:application/features/animes/presentation/bloc/video/video_event.dart';
import 'package:application/features/animes/presentation/bloc/watch/watch_bloc.dart';
import 'package:application/features/animes/presentation/bloc/watch/watch_state.dart';
import 'package:application/features/animes/presentation/widgets/episodes_list.dart';
import 'package:application/features/animes/presentation/widgets/video_player.dart';
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
              final watchState = context.watch<WatchBloc>().state;
              final isEpisodeSelected = watchState is WatchDone;
              final episode = isEpisodeSelected ? watchState : null;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 500,
                        child: Row(
                          children: [
                            Expanded(child: videoPlayer(context)),
                            SizedBox(width: 450, child: EpisodesList()),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 50, top: 20),
                        constraints: BoxConstraints(maxWidth: 1100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: .max,
                          spacing: 10,
                          children: [
                            Text(
                              "${state.anime.title.uz}${isEpisodeSelected ? " ${episode!.currentEpisode.episodeNumber}-qism: ${episode.currentEpisode.title.uz}" : ""}",
                              style: context.textTheme.headlineMedium,
                            ),
                            Text(state.anime.description.uz, style: context.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            default:
              return Text("Nimadur xato ketti");
          }
        },
      ),
    );
  }

  Widget videoPlayer(BuildContext context) {
    return BlocConsumer<WatchBloc, WatchState>(
      listener: (context, state) {
        if (state is WatchDone) {
          final bloc = context.read<VideoBloc>();
          if (state.currentEpisode.type == EpisodeType.free ||
              state.currentEpisode.video.isNotEmpty) {
            bloc.add(GetVideo(state.currentEpisode.video));
          } else {
            bloc.add(SetVideoIsPaid());
          }
        }
      },
      builder: (context, state) {
        switch (state) {
          case WatchLoading():
            return Center(child: CircularProgressIndicator());
          case WatchFailure():
            return Center(child: Text(state.message));
          case WatchDone():
            print(state.currentEpisode.isDownloaded);
            return ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadiusGeometry.circular(15),
              child: VideoPlayer(
                title: (context.read<AnimeBloc>().state as AnimeSuccess).anime.title.uz,
                path: state.currentEpisode.video,
              ),
            );
          default:
            return Center(child: Text("Nimadur xato ketti"));
        }
      },
    );
  }
}
