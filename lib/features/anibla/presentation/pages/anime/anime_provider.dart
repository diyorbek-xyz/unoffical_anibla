import 'package:application/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:application/features/player/presentation/cubit/player/player_controller.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeProvider extends StatelessWidget {
  final Widget child;
  const AnimeProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<CommentBloc>()),
        BlocProvider(create: (context) => sl<PlayerController>()),
      ],
      child: child,
    );
  }
}
