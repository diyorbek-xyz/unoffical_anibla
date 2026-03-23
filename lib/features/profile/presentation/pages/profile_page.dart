import 'package:application/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile_event.dart';
import 'package:application/features/profile/presentation/bloc/profile_state.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(GetProfile()),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileUnauthorized) {
            return Column(
              children: [
                Text("Akkountga kirish"),
                ElevatedButton(onPressed: () => context.pushNamed("login"), child: Text("login")),
              ],
            );
          }
          if (state is ProfileLimitSession) {
            return Column(
              children: [
                Text("${state.sessions.name} ${state.sessions.total}"),
                ...state.sessions.sessions.map((e) => ListTile(title: Text(e.device))),
              ],
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [ElevatedButton(onPressed: () => context.read<ProfileBloc>().add(GetProfile()), child: Text("refresh"))],
            ),
          );
        },
      ),
    );
  }
}
