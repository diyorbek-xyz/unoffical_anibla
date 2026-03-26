import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:application/features/profile/presentation/bloc/session/session_bloc.dart';
import 'package:application/features/profile/presentation/widget/profile_main.dart';
import 'package:application/features/profile/presentation/widget/sessions.dart';
import 'package:application/features/profile/presentation/widget/skeleton.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProfileBloc>()..add(GetProfile())),
        BlocProvider(create: (context) => sl<SessionBloc>()),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileUnauthorized) {
            return unauthorizedBuilder(context);
          }
          if (state is ProfileError) {
            return errorBuilder(state, context);
          }
          if (state is ProfileLimitSession) {
            return SessionsFailureWidget(sessions: state.sessions);
          }
          if (state is ProfileSuccess || state is ProfileLoading) {
            final loading = state is ProfileLoading;
            return Skeletonizer(
              justifyMultiLineText: true,
              effect: PulseEffect(
                duration: Duration(seconds: 1),
                from: context.appColors.primary,
                to: context.appColors.onPrimary,
              ),
              enabled: loading,
              child: !loading
                  ? ProfileMain(data: (state as ProfileSuccess).data)
                  : ProfileSkeleton(),
            );
          }
          return Text("Nimadur xato ketti");
        },
      ),
    );
  }

  SizedBox unauthorizedBuilder(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: 10,
        children: [
          Text("Royxatdan otish", style: TextStyle(fontSize: 28)),
          ElevatedButton(onPressed: () => context.pushNamed("login"), child: Text("Kirish")),
        ],
      ),
    );
  }

  Column errorBuilder(ProfileError state, BuildContext context) {
    return Column(
      children: [
        Text(state.message),
        ElevatedButton(
          onPressed: () => context.read<ProfileBloc>().add(GetProfile()),
          child: Text("Yangilash"),
        ),
      ],
    );
  }
}
