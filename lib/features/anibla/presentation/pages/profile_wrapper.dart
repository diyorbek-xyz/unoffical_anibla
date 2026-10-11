import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/anibla/presentation/pages/profile_page.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:application/features/anibla/presentation/controllers/profile_controller.dart';
import 'package:application/features/anibla/presentation/controllers/profile_errors.dart';
import 'package:application/features/anibla/presentation/widgets/sessions.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileWrapper extends StatefulWidget {
  final bool isMano;
  const ProfileWrapper(this.isMano, {super.key});

  @override
  State<ProfileWrapper> createState() => _ProfileWrapperState();
}

class _ProfileWrapperState extends State<ProfileWrapper> {
  late final profileController = sl<ProfileController>();

  int currentIndex = 0;
  bool inTabs = true;

  void setCurrentIndex(int index) => setState(() => [currentIndex = index, inTabs = false]);
  void goToTabs() => setState(() => inTabs = true);

  @override
  Widget build(BuildContext context) {
    return SignalAnimatedBuilder(
      builder: (context, child) {
        final aniblaState = profileController.aniblaProfile.value;
        final manoState = profileController.manoProfile.value;
        if (aniblaState.hasError) {
          return switch (aniblaState.error as ProfileFailure) {
            ProfileLimitSession(:final sessions) => SessionsFailureWidget(sessions: sessions),
            ProfileUnauthorized() => unauthorizedBuilder(context),
            ProfileFailed(:final message) => ErrorBuilder(message: message, refresh: profileController.refreshAll),
          };
        }
        final profile = widget.isMano ? manoState.value : aniblaState.value;
        final fakeProfile = widget.isMano ? profileController.fakeMano : profileController.fakeAnibla;
        final isLoading = aniblaState.isLoading || manoState.isLoading;
        return Skeletonizer(
          justifyMultiLineText: true,
          effect: PulseEffect(duration: Duration(seconds: 1), from: context.appColors.primary, to: context.appColors.onPrimary),
          enabled: isLoading,
          child: ProfilePage(profile ?? fakeProfile),
        );
      },
    );
  }

  SizedBox unauthorizedBuilder(BuildContext context) => SizedBox.expand(
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
