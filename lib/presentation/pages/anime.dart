import 'package:application/data/models/param_models/episode_params.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_bloc.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_event.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_state.dart';
import 'package:application/presentation/bloc/video/remote/remote_video_bloc.dart';
import 'package:application/presentation/bloc/video/remote/remote_video_event.dart';
import 'package:application/presentation/bloc/video/remote/remote_video_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimePage extends StatefulWidget {
  final String slug;
  const AnimePage({super.key, required this.slug});
  @override
  State<StatefulWidget> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteEpisodesListBloc>(
          create: (context) => sl()..add(GetEpisodesList(GetEpisodesParams(animeSlug: widget.slug, seasonSlug: "1"))),
        ),
        BlocProvider<RemoteVideoBloc>(create: (context) => sl()),
      ],
      child: Scaffold(appBar: _appBar(context), body: _bodyBuilder()),
    );
  }

  BlocBuilder<RemoteEpisodesListBloc, RemoteEpisodesListState> _bodyBuilder() {
    return BlocBuilder<RemoteEpisodesListBloc, RemoteEpisodesListState>(
      builder: (context, state) {
        if (state is RemoteEpisodesListFailed) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text("${state.exception?.response} ${state.exception}"),
                ElevatedButton.icon(
                  onPressed: () => context.read<RemoteEpisodesListBloc>().add(
                    GetEpisodesList(GetEpisodesParams(animeSlug: widget.slug, seasonSlug: "1-fasl")),
                  ),
                  icon: Icon(Icons.replay_outlined),
                  label: Text("Yanglilash"),
                ),
              ],
            ),
          );
        }
        if (state is RemoteEpisodesListDone || state is RemoteEpisodesListLoading) {
          return Skeletonizer(
            enabled: state is RemoteEpisodesListLoading,
            child: RefreshIndicator.adaptive(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: () async =>
                  context.read<RemoteEpisodesListBloc>().add(GetEpisodesList(GetEpisodesParams(animeSlug: widget.slug, seasonSlug: "1"))),
              child: SingleChildScrollView(physics: PageScrollPhysics(), child: _layout(state)),
            ),
          );
        }
        return Text('no data');
      },
    );
  }

  Padding _layout(RemoteEpisodesListState state) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 100),
              child: Column(
                children: [
                  _videoPlayer(state),
                  Container(color: Colors.green),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 100),
              child: Container(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  AspectRatio _videoPlayer(RemoteEpisodesListState state) {
    return AspectRatio(
      aspectRatio: 15 / 9,
      child: state.episodes != null
          ? BlocBuilder<RemoteVideoBloc, RemoteVideoState>(
              builder: (context, videoState) {
                if (state.episodes != null) {
                  return Center(child: Text("Bu animeni ko'rish uchun pul to'lang"));
                }
                context.read<RemoteVideoBloc>().add(GetVideo(state.episodes![0].video));
                if (videoState is RemoteVideoFailed) {
                  return Center(child: Text(videoState.exception.toString()));
                }
                if (videoState is RemoteVideoDone || videoState is RemoteVideoLoading) {
                  return Skeletonizer(
                    enabled: videoState is RemoteVideoLoading,
                    child: Container(color: Colors.amber),
                    // VideoPlayer(video: videoState.video),
                  );
                }
                return Placeholder(color: Colors.amber);
              },
            )
          : Placeholder(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
      title: BlocSelector<RemoteEpisodesListBloc, RemoteEpisodesListState, String>(
        selector: (state) {
          if (state is RemoteEpisodesListDone && state.episodes!.isNotEmpty) return state.episodes!.first.anime.title.uz;
          return "Loading...";
        },
        builder: (context, state) {
          return Text(state);
        },
      ),
    );
  }
}
