import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeEpisodesMenu extends StatelessWidget {
  final AnimeEntity anime;
  const AnimeEpisodesMenu({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodeBloc, EpisodeState>(
      builder: (context, state) {
        if (state is EpisodeLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is EpisodeFailure) {
          return Center(child: Text(state.message));
        }
        if (state is EpisodeSuccess) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: state.episodes
                    .map(
                      (e) => ListTile(
                        onTap: () {},
                        leading: Icon(
                          e.type == EpisodeType.free
                              ? Icons.money_off
                              : Icons.attach_money,
                        ),
                        title: Text("${e.episodeNumber}-qism"),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        }
        return Text("Nimadur xato ketti");
      },
    );
  }
}
