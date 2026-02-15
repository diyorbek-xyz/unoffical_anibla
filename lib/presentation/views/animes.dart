import 'package:application/data/models/param_models/anime_params.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_bloc.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_event.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_state.dart';
import 'package:application/presentation/widgets/ui/anime_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class AnimesView extends StatefulWidget {
  const AnimesView({super.key});

  @override
  State<AnimesView> createState() => _AnimesViewState();
}

class _AnimesViewState extends State<AnimesView> {
  final params = const GetAnimesParams(limit: 10, page: 1);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RemoteAnimeBloc>()..add(GetAnimes(params)),
      child: RefreshIndicator.adaptive(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async => context.read<RemoteAnimeBloc>().add(RefreshAnimes(params)),
        child: SingleChildScrollView(
          child: BlocBuilder<RemoteAnimeBloc, RemoteAnimeState>(
            builder: (context, state) {
              if (state is RemoteAnimeLoading) {
                return Center(child: CircularProgressIndicator.adaptive());
              }
              if (state is RemoteAnimeFailed) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(state.exception!.error.toString()),
                      ElevatedButton.icon(
                        onPressed: () => context.read<RemoteAnimeBloc>().add(RefreshAnimes(params)),
                        icon: Icon(Icons.replay_outlined),
                        label: Text("Yanglilash"),
                      ),
                    ],
                  ),
                );
              }
              if (state is RemoteAnimeDone) {
                return Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: ResponsiveGridList(
                    minItemWidth: 150,
                    maxItemsPerRow: 6,
                    verticalGridSpacing: 0,
                    horizontalGridSpacing: 0,
                    listViewBuilderOptions: ListViewBuilderOptions(physics: NeverScrollableScrollPhysics(), shrinkWrap: true),
                    children: state.animes?.map((anime) => WidgetAnimeCard(anime: anime)).toList() ?? [],
                  ),
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
