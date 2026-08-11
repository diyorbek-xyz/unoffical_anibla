import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/domain/entities/tab_item.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/profile/presentation/controller/profile_controller.dart';
import 'package:application/features/profile/presentation/controller/profile_errors.dart';
import 'package:application/features/profile/presentation/menu/devices_menu.dart';
import 'package:application/features/profile/presentation/menu/infos_menu.dart';
import 'package:application/features/profile/presentation/menu/notifications_menu.dart';
import 'package:application/features/profile/presentation/menu/plans_menu.dart';
import 'package:application/features/profile/presentation/menu/privacy_settings.dart';
import 'package:application/features/profile/presentation/widget/avatar_selector.dart';
import 'package:application/features/profile/presentation/widget/sessions.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/profile/presentation/widget/modals/logout_modal.dart';

final List<TabItem> tabs = [
  TabItem(path: "infos", activeIcon: Icons.info, icon: Icons.info_outline, label: "Profil ma'lumotlari"),
  TabItem(path: "notifications", activeIcon: Icons.notifications, icon: Icons.notifications_outlined, label: "Bildirishnomalar"),
  TabItem(path: "plans", activeIcon: Icons.verified, icon: Icons.verified_outlined, label: "Obunalar"),
  TabItem(path: "devices", activeIcon: Icons.devices, icon: Icons.devices_outlined, label: "Qurilmalar"),
  TabItem(path: "privacy", activeIcon: Icons.privacy_tip, icon: Icons.privacy_tip_outlined, label: "Xavfsizlik sozlamalari"),
];

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Widget> get views => [ProfileInfosMenu(), NotificationsMenu(), PlansMenu(), ProfileDevicesMenu(), PrivacySettings()];

  late ProfileController profileController;
  int currentIndex = 0;
  bool inTabs = true;

  void setCurrentIndex(int index) => setState(() => [currentIndex = index, inTabs = false]);
  void goToTabs() => setState(() => inTabs = true);

  @override
  void initState() {
    super.initState();
    profileController = sl<ProfileController>();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: LayoutBuilder(
        builder: (context, constraints) => Responsive(constraints: constraints, child: sliverMethod()),
      ),
    );
  }

  Widget sliverMethod() => SignalBuilder(
    builder: (context) {
      final state = profileController.profileSignal.value;
      if (state.hasError) {
        return switch (state.error as ProfileFailure) {
          ProfileLimitSession(:final sessions) => SessionsFailureWidget(sessions: sessions),
          ProfileUnauthorized() => unauthorizedBuilder(context),
          ProfileFailed(:final message) => ErrorBuilder(message: message, refresh: profileController.refreshAll),
        };
      }
      final resp = Responsive.of(context);
      return Skeletonizer(
        justifyMultiLineText: true,
        effect: PulseEffect(duration: Duration(seconds: 1), from: context.appColors.primary, to: context.appColors.onPrimary),
        enabled: state.isLoading,
        child: (resp.isMobile && !inTabs)
            ? Column(
                children: [
                  ListTile(
                    leading: IconButton(onPressed: goToTabs, icon: Icon(Icons.keyboard_arrow_left)),
                    title: Text(tabs[currentIndex].label),
                    minTileHeight: 70,
                  ),
                  Expanded(child: views[currentIndex]),
                ],
              )
            : CustomScrollView(
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  CupertinoSliverRefreshControl(onRefresh: profileController.refreshAll),
                  resp.isMobile
                      ? SliverPadding(
                          padding: .symmetric(vertical: 30, horizontal: 15),
                          sliver: SliverToBoxAdapter(child: basicInfo),
                        )
                      : SliverToBoxAdapter(child: basicInfo),
                  SliverPadding(
                    padding: resp.isMobile ? .symmetric(horizontal: 5) : .only(right: 15),
                    sliver: resp.isMobile ? mobileBody() : desktopBody(),
                  ),
                ],
              ),
      );
    },
  );

  Widget mobileBody() => SliverToBoxAdapter(child: navTabs());

  Widget desktopBody() => SliverCrossAxisGroup(
    slivers: [
      SliverConstrainedCrossAxis(maxExtent: 350, sliver: SliverToBoxAdapter(child: navTabs())),
      SliverConstrainedCrossAxis(maxExtent: 10, sliver: SliverToBoxAdapter()),
      SliverFillRemaining(child: views[currentIndex]),
    ],
  );

  Widget navTabs() => ListView.separated(
    physics: NeverScrollableScrollPhysics(),
    addRepaintBoundaries: true,
    shrinkWrap: true,
    itemCount: tabs.length,
    separatorBuilder: (context, index) => const SizedBox(height: 5),
    itemBuilder: (context, i) {
      final tab = tabs[i];
      final index = i;
      final selected = index == currentIndex;
      return ListTile(
        title: Text(tab.label),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(100)),
        onTap: () => setCurrentIndex(index),
        tileColor: Colors.transparent,
        selected: selected,
        selectedTileColor: context.appColors.primaryFixed.withValues(alpha: 0.1),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 11),
        leading: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: selected ? context.appColors.primary : context.appColors.onPrimary,
          ),
          padding: EdgeInsets.all(10),
          child: Icon(tab.icon, color: selected ? context.appColors.onPrimary : context.appColors.primary),
        ),
      );
    },
  );

  Widget get basicInfo => SignalBuilder(
    builder: (context) {
      final state = profileController.profileSignal.value;
      final isLoading = !state.hasValue;
      final data = state.value ?? profileController.fakeProfile;
      final responsive = Responsive.of(context);
      late Widget child;
      if (responsive.isMobile) {
        child = Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .start,
          children: [
            AvatarSelector(url: data.image, isLoading: isLoading),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: data.name, style: TextStyle(fontSize: 24)),
                  if (data.subscription != null) WidgetSpan(child: Icon(Icons.verified, color: context.appColors.onSurface)),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.white70),
                children: [TextSpan(text: "Balans: ${data.balance} so'm")],
              ),
            ),
          ],
        );
      } else {
        child = Row(
          crossAxisAlignment: .center,
          spacing: 10,
          children: [
            AvatarSelector(url: data.image, isLoading: isLoading),
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: data.name, style: TextStyle(fontSize: 24)),
                      if (data.subscription != null) WidgetSpan(child: Icon(Icons.verified, color: context.appColors.onSurface)),
                    ],
                  ),
                ),
                Text("Balans: ${data.balance} so'm", style: TextStyle(fontSize: 16, color: Colors.white70)),
              ],
            ),
            Expanded(child: Container()),
            IconButton(
              onPressed: () => showLogoutModal(context, tokenId: data.tokenId, isCurrent: true),
              icon: Icon(Icons.exit_to_app),
            ),
            SizedBox(width: 30),
          ],
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20).add(.only(top: responsive.isMobile ? 0 : 40)),
        child: child,
      );
    },
  );

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
}
