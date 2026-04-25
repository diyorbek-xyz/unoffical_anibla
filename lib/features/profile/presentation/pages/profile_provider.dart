import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:application/features/profile/presentation/bloc/session/session_bloc.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileProvider extends StatelessWidget {
  final Widget child;
  const ProfileProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProfileBloc>()..add(GetProfile())),
        BlocProvider(create: (context) => sl<SessionBloc>()),
      ],
      child: child,
    );
  }
}
