import 'package:application/core/constants/theme.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/profile/domain/entities/session_entity.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:application/features/profile/presentation/bloc/session/session_bloc.dart';
import 'package:application/features/profile/presentation/bloc/session/session_event.dart';
import 'package:application/features/profile/presentation/bloc/session/session_state.dart';
import 'package:application/features/profile/presentation/widget/platform.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionsFailureWidget extends StatelessWidget {
  final SessionsEntity sessions;
  const SessionsFailureWidget({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SessionBloc>(),
      child: Align(
        alignment: AlignmentGeometry.center,
        child: Container(
          width: 600,
          alignment: AlignmentGeometry.center,
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Qurilmalar soni limitiga yetdi", style: TextStyle(fontSize: 30)),
              BlocConsumer<SessionBloc, SessionState>(
                listener: (context, state) {
                  if (state is SessionExitSuccess) context.read<ProfileBloc>().add(GetProfile());
                },
                builder: (context, state) {
                  final bool loading = state is SessionExitLoading;
                  return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      ...sessions.sessions.map(
                        (e) => ListTile(
                          textColor: onSurface,
                          iconColor: onSurface,
                          onTap: () {},
                          isThreeLine: true,
                          leading: PlatformWidget(platform: e.platform),
                          title: Text(e.device),
                          subtitle: Text(
                            "So'ngi kirish: ${e.lastLogin.formatCompact()} ${e.lastLogin.formatTime()} \t IP: ${e.lastIp}",
                          ),
                          trailing: !loading
                              ? IconButton(
                                  onPressed: () =>
                                      context.read<SessionBloc>().add(ExitSession(e.tokenId)),
                                  color: Colors.red,
                                  icon: Icon(Icons.exit_to_app),
                                )
                              : CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
