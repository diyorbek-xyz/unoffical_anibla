import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/explore/presentation/bloc/search/search_bloc.dart';
import 'package:application/features/explore/presentation/bloc/search/search_event.dart';
import 'package:application/features/explore/presentation/bloc/search/search_state.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleRecommend extends StatelessWidget {
  final List<String> ids;
  final String title;
  const TitleRecommend({super.key, required this.ids, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>()..add(SearchAnime(genres: ids)),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is! SearchFound) return Text("data");
          return Wrap(children: state.movies.map((e) => AnimeCard(anime: e)).toList());
        },
      ),
    );
  }
}
