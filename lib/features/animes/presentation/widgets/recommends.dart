import 'package:application/features/animes/presentation/widgets/title_recommend.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_bloc.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_event.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_state.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Recommends extends StatelessWidget {
  const Recommends({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GenreBloc>()..add(GetGenres()),
      child: BlocBuilder<GenreBloc, GenreState>(
        builder: (context, state) {
          if (state is! GenresFullSuccess) return Text("data");
          final recommends = state.data.where((e) => recommended.contains(e.slug)).map((e) => e.id);
          return Column(
            children: recommends.map((e) => TitleRecommend(ids: [e], title: e)).toList(),
          );
        },
      ),
    );
  }
}

final recommended = ['sir', "iblislar", "jang-san-ati", "o-yinlar", "sport", "detektiv", "garem"];
