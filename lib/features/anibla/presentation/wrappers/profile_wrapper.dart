import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/anibla/data/view_model/profile_view.dart';
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

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButtonLocation: .startFloat,
    floatingActionButton: FloatingActionButton.extended(
      icon: Icon(widget.isMano ? Icons.movie : Icons.menu_book),
      label: Text(widget.isMano ? "Anibla profile" : "Mano profile"),
      onPressed: () => context.goNamed(widget.isMano ? "anibla" : "mano"),
    ),
    body: SignalAnimatedBuilder(
      builder: (context, child) {
        final aniblaState = profileController.aniblaProfile.value;
        final manoState = profileController.manoProfile.value;
        final notfState = profileController.notificationSignal.value;
        final plansState = profileController.plansSignal.value;
        if (manoState.hasError && widget.isMano) {
          return switch (manoState.error as ProfileFailure) {
            ProfileUnauthorized() => manoUnauthorizedBuilder(),
            ProfileFailed(:final message) => ErrorBuilder(message: message, refresh: profileController.refreshAll),
            _ => Text("data"),
          };
        }
        if (aniblaState.hasError && !widget.isMano) {
          return switch (aniblaState.error as ProfileFailure) {
            ProfileLimitSession(:final sessions) => SessionsFailureWidget(sessions: sessions),
            ProfileUnauthorized() => aniblaUnauthorizedBuilder(),
            ProfileFailed(:final message) => ErrorBuilder(message: message, refresh: profileController.refreshAll),
          };
        }
        final mano = manoState.value ?? profileController.fakeMano;
        final anibla = aniblaState.value ?? profileController.fakeAnibla;
        final isLoading = aniblaState.isLoading || manoState.isLoading || notfState.isLoading || plansState.isLoading;
        final profile = widget.isMano ? ProfileView.fromMano(mano) : ProfileView.fromAnibla(anibla);
        final notifications = notfState.value ?? profileController.fakeNotification;
        final plans = plansState.value ?? profileController.fakePlans;
        return Skeletonizer(
          enabled: isLoading,
          justifyMultiLineText: true,
          effect: PulseEffect(duration: Duration(seconds: 1), from: context.appColors.primary, to: context.appColors.onPrimary),
          child: ProfilePage(
            notifications: notifications,
            profile: profile,
            plans: plans,
            sessions: anibla.sessions,
            privacy: anibla.privacySettings,
          ),
        );
      },
    ),
  );

  SizedBox manoUnauthorizedBuilder() => SizedBox.expand(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      spacing: 10,
      children: [
        Text("Royxatdan otish", style: TextStyle(fontSize: 28)),
        ElevatedButton(onPressed: profileController.loginManoWithAnibla, child: Text("Anibla orqali kirish")),
      ],
    ),
  );

  SizedBox aniblaUnauthorizedBuilder() => SizedBox.expand(
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
