import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:application/features/profile/presentation/widget/profile_main.dart';
import 'package:application/features/profile/presentation/widget/sessions.dart';
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
          if (state is ProfileError) {
            return Column(
              children: [
                Text(state.message),
                ElevatedButton(onPressed: () => context.pushNamed("login"), child: Text("login")),
              ],
            );
          }
          if (state is ProfileLimitSession) {
            return SessionsFailureWidget(sessions: state.sessions);
          }
          if (state is ProfileLoading) {
            return Container(
              alignment: AlignmentGeometry.center,
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is ProfileSuccess) {
            return ProfileMain(data: state.data);
          }
          return Text("Nimadur xato ketti");
        },
      ),
    );
  }
}
