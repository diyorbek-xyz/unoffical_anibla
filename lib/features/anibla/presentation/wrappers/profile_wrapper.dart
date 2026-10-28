import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/anibla/data/view_model/profile_view.dart';
import 'package:application/features/anibla/presentation/menus/profile/devices_menu.dart';
import 'package:application/features/anibla/presentation/menus/profile/infos_menu.dart';
import 'package:application/features/anibla/presentation/menus/profile/notifications_menu.dart';
import 'package:application/features/anibla/presentation/menus/profile/plans_menu.dart';
import 'package:application/features/anibla/presentation/menus/profile/privacy_settings.dart';
import 'package:application/features/anibla/presentation/pages/profile_page.dart';
import 'package:application/features/mano/presentation/controllers/mano_profile_controller.dart';
import 'package:application/features/view/models/notification_view.dart';
import 'package:application/features/view/models/tab_view.dart';
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
  late final aniblaController = sl<ProfileController>();
  late final manoController = sl<ManoProfileController>();

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButtonLocation: .startFloat,
    floatingActionButton: FloatingActionButton.extended(
      heroTag: "profile",
      icon: Icon(widget.isMano ? Icons.movie : Icons.menu_book),
      label: Text(widget.isMano ? "Anibla profile" : "Mano profile"),
      onPressed: () => context.goNamed(widget.isMano ? "anibla" : "mano"),
    ),
    body: widget.isMano ? manoProfileBuilder() : aniblaProfileBuilder(),
  );

  SignalBuilder aniblaProfileBuilder() => SignalBuilder(
    builder: (context) {
      final aniblaState = aniblaController.profileSignal.value;
      final aniblaNotfState = aniblaController.notificationSignal.value;
      final plansState = aniblaController.plansSignal.value;

      if (aniblaState.hasError && !widget.isMano) {
        return switch (aniblaState.error as ProfileFailure) {
          ProfileLimitSession(:final sessions) => SessionsFailureWidget(sessions: sessions),
          ProfileUnauthorized() => aniblaUnauthorizedBuilder(),
          ProfileFailed(:final message) => ErrorBuilder(message: message, refresh: aniblaController.refreshAll),
        };
      }

      final profile = aniblaState.value ?? aniblaController.fakeAnibla;
      final view = ProfileView.fromAnibla(profile);
      final isLoading = aniblaState.isLoading || aniblaNotfState.isLoading || plansState.isLoading;
      final aniblaNotifications = aniblaNotfState.value ?? aniblaController.fakeNotification;
      final notifications = aniblaNotifications.data.map(NotificationView.fromAnibla).toList();
      final plans = plansState.value ?? aniblaController.fakePlans;
      return Skeletonizer(
        enabled: isLoading,
        justifyMultiLineText: true,
        effect: PulseEffect(duration: Duration(seconds: 1), from: context.appColors.primary, to: context.appColors.onPrimary),
        child: ProfilePage(
          tabViews: [
            TabView(
              TabItem(activeIcon: Icons.info, icon: Icons.info_outline, label: "Profil ma'lumotlari"),
              ProfileInfosMenu(view),
            ),
            TabView(
              TabItem(activeIcon: Icons.notifications, icon: Icons.notifications_outlined, label: "Bildirishnomalar"),
              NotificationsMenu(notifications),
            ),
            TabView(TabItem(activeIcon: Icons.verified, icon: Icons.verified_outlined, label: "Obunalar"), PlansMenu(plans)),
            TabView(
              TabItem(activeIcon: Icons.devices, icon: Icons.devices_outlined, label: "Qurilmalar"),
              ProfileDevicesMenu(profile.sessions, view.tokenId),
            ),
            TabView(
              TabItem(activeIcon: Icons.privacy_tip, icon: Icons.privacy_tip_outlined, label: "Xavfsizlik sozlamalari"),
              PrivacySettings(profile.privacySettings),
            ),
          ],
          profile: view,
        ),
      );
    },
  );

  SignalBuilder manoProfileBuilder() => SignalBuilder(
    builder: (context) {
      final manoState = manoController.profileSignal.value;
      final manoNotfState = manoController.notificationSignal.value;

      if (manoState.hasError) {
        return switch (manoState.error as ProfileFailure) {
          ProfileUnauthorized() => manoUnauthorizedBuilder(),
          ProfileFailed(:final message) => ErrorBuilder(message: message, refresh: aniblaController.refreshAll),
          _ => Text("data"),
        };
      }

      final mano = manoState.value ?? manoController.fakeProfile;
      final isLoading = manoState.isLoading || manoNotfState.isLoading;
      final profile = ProfileView.fromMano(mano);
      final manoNotifications = manoNotfState.value ?? manoController.fakeNotifications;
      final notifications = manoNotifications.map(NotificationView.fromMano).toList();
      return Skeletonizer(
        enabled: isLoading,
        justifyMultiLineText: true,
        effect: PulseEffect(duration: Duration(seconds: 1), from: context.appColors.primary, to: context.appColors.onPrimary),
        child: ProfilePage(
          tabViews: [
            TabView(
              TabItem(activeIcon: Icons.info, icon: Icons.info_outline, label: "Profil ma'lumotlari"),
              ProfileInfosMenu(profile),
            ),
            TabView(
              TabItem(activeIcon: Icons.notifications, icon: Icons.notifications_outlined, label: "Bildirishnomalar"),
              NotificationsMenu(notifications),
            ),
          ],
          profile: profile,
        ),
      );
    },
  );

  SizedBox manoUnauthorizedBuilder() => SizedBox.expand(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      spacing: 10,
      children: [
        Text("Royxatdan otish", style: TextStyle(fontSize: 28)),
        ElevatedButton(onPressed: manoController.loginManoWithAnibla, child: Text("Anibla orqali kirish")),
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
