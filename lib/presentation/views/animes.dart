import 'package:application/domain/usecases/anime_usecase.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_bloc.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_event.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_state.dart';
import 'package:application/presentation/widgets/ui/anime_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimesView extends StatefulWidget {
  const AnimesView({super.key});

  @override
  State<AnimesView> createState() => _AnimesViewState();
}

class _AnimesViewState extends State<AnimesView> {
  final getAnimes = const GetAnimes(GetAnimesParams(limit: 10, page: 1));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RemoteAnimeBloc>()..add(getAnimes),
      child: RefreshIndicator.adaptive(
        onRefresh: () async {},
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
                    ElevatedButton.icon(onPressed: () => getAnimes, icon: Icon(Icons.replay_outlined), label: Text("Yanglilash")),
                  ],
                ),
              );
            }
            if (state is RemoteAnimeDone) {
              return Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                child: GridView.extent(
                  maxCrossAxisExtent: 270,
                  childAspectRatio: 6 / 8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 15,
                  children: state.animes!.map((anime) => WidgetAnimeCard(anime: anime)).toList(),
                ),
              );
            }
            return Text('no data');
          },
        ),
      ),
    );
  }
}
