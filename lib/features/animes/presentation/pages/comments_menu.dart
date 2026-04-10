import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/comment/data/models/props.dart';
import 'package:application/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:application/features/comment/presentation/bloc/comment_event.dart';
import 'package:application/features/comment/presentation/bloc/comment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsMenu extends StatefulWidget {
  const CommentsMenu({super.key});

  @override
  State<CommentsMenu> createState() => _CommentsMenuState();
}

class _CommentsMenuState extends State<CommentsMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AnimeBloc, AnimeState>(
      listener: (context, state) {
        if (state is AnimeSuccess) {
          final type = state.anime.totalEpisodes == null ? "movies" : "series";
          final props = GetCommentsProps(
            id: state.anime.id,
            limit: 10,
            page: 1,
            type: type,
          );
          context.read<CommentBloc>().add(GetComments(props));
        }
      },
      child: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentSuccess) {
            return Text(state.data.toString());
          }
          return Text("Comments");
        },
      ),
    );
  }
}
