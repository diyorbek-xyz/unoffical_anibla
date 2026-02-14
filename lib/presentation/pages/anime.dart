import 'package:application/domain/usecases/episode_usecase.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_bloc.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_event.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AnimePage extends StatefulWidget {
  final String id;
  const AnimePage({super.key, required this.id});
  @override
  State<StatefulWidget> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteEpisodeBloc>(
      create: (context) => sl()..add(const GetEpisodes(GetEpisodesParams(animeSlug: "dmc", seasonSlug: "1-fasl"))),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {},
          child: BlocBuilder(
            builder: (context, state) {
              if (state is RemoteEpisodeLoading) {
                return Center(child: CircularProgressIndicator.adaptive());
              }
              if (state is RemoteEpisodeFailed) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(state.exception.toString()),
                      ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.replay_outlined), label: Text("Yanglilash")),
                    ],
                  ),
                );
              }
              if (state is RemoteEpisodeDone) {
                return ListView.builder(
                  itemCount: state.episodes!.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(state.episodes![index].title?.uz ?? "title"));
                  },
                );
              }
              return Text('no data');
            },
          ),
        ),
      ),
    );
  }
}
