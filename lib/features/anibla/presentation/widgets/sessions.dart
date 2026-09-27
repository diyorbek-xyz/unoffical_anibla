import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/data/models/data/session.dart';
import 'package:application/features/anibla/presentation/controllers/profile_controller.dart';
import 'package:application/features/anibla/presentation/widgets/platform.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SessionsFailureWidget extends StatelessWidget {
  final Sessions sessions;
  const SessionsFailureWidget({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    final profileController = sl<ProfileController>();
    return Center(
      child: Container(
        width: 600,
        alignment: AlignmentGeometry.center,
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Qurilmalar soni limitiga yetdi", style: TextStyle(fontSize: 30)),
            SignalBuilder(
              builder: (context) {
                final state = profileController.sessionExitSignal.value;
                final bool loading = state.isLoading;
                return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: sessions.sessions
                      .map(
                        (e) => ListTile(
                          textColor: context.appColors.onSurface,
                          iconColor: context.appColors.onSurface,
                          onTap: () {},
                          isThreeLine: true,
                          leading: PlatformWidget(platform: e.platform),
                          title: Text(e.device),
                          subtitle: Text(
                            "So'ngi kirish: ${DateTime.tryParse(e.lastLogin)?.formatCompact()} ${DateTime.tryParse(e.lastLogin)?.formatTime()} \t IP: ${e.lastIp}",
                          ),
                          trailing: !loading
                              ? IconButton(
                                  onPressed: () => profileController.exitSession(e.tokenId),
                                  color: Colors.red,
                                  icon: Icon(Icons.exit_to_app),
                                )
                              : CircularProgressIndicator(),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
