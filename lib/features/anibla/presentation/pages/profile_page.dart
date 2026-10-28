import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/anibla/data/enums/data_type.dart';
import 'package:application/features/anibla/data/view_model/profile_view.dart';
import 'package:application/features/view/models/tab_view.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/presentation/controllers/profile_controller.dart';
import 'package:application/features/anibla/presentation/widgets/avatar_selector.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:application/shared/widgets/responsive.dart';
import 'package:application/features/anibla/presentation/dialogs/logout_modal.dart';

class ProfilePage extends StatefulWidget {
  final ProfileView profile;
  final List<TabView> tabViews;
  const ProfilePage({super.key, required this.profile, required this.tabViews});

  DataType get type => profile.type;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController profileController = sl<ProfileController>();

  int currentIndex = 0;
  bool inTabs = true;

  void setCurrentIndex(int index) => setState(() => [currentIndex = index, inTabs = false]);
  void goToTabs() => setState(() => inTabs = true);

  @override
  Widget build(BuildContext context) => SignalBuilder(
    builder: (context) {
      final isMobile = context.isMobile;
      if (isMobile && !inTabs) {
        return Column(
          children: [
            ListTile(
              leading: IconButton(onPressed: goToTabs, icon: Icon(Icons.keyboard_arrow_left)),
              title: Text(widget.tabViews[currentIndex].tab.label),
              minTileHeight: 70,
            ),
            Expanded(child: widget.tabViews[currentIndex].view),
          ],
        );
      }
      return SingleChildScrollView(
        padding: .only(bottom: isMobile ? 50 : 0),
        child: Column(
          children: [
            basicInfo(
              balance: widget.profile.balance,
              image: widget.profile.avatar,
              name: widget.profile.name,
              tokenId: widget.profile.tokenId,
              isSubscribed: widget.profile.hasSubscription,
            ),
            Padding(padding: isMobile ? .symmetric(horizontal: 5) : .only(right: 15), child: isMobile ? mobileBody : desktopBody),
          ],
        ),
      );
    },
  );

  Widget get mobileBody => navTabs;

  Widget get desktopBody => Row(
    spacing: 10,
    crossAxisAlignment: .start,
    children: [
      SizedBox(width: 350, child: navTabs),
      Expanded(child: widget.tabViews[currentIndex].view),
    ],
  );

  Widget get navTabs => ListView.separated(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    addRepaintBoundaries: true,
    addAutomaticKeepAlives: false,
    itemCount: widget.tabViews.length,
    separatorBuilder: (context, index) => const SizedBox(height: 5),
    itemBuilder: (context, i) {
      final tab = widget.tabViews[i].tab;
      final index = i;
      final selected = index == currentIndex;
      final isNotf = index == 1;
      final notfS = profileController.notificationSignal.value.value?.data.length;
      return ListTile(
        title: Text("${tab.label}${isNotf ? " ($notfS)" : ""}"),
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

  Widget basicInfo({
    required String image,
    required String balance,
    required String name,
    required bool isSubscribed,
    String? tokenId,
  }) => PlatformBuilder(
    containerBuilder: (context, _, isMobile, child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20).add(.only(top: isMobile ? 0 : 40)),
      child: child,
    ),
    mobileBuilder: (_, _) => Padding(
      padding: .symmetric(vertical: 30, horizontal: 15),
      child: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .start,
        children: [
          AvatarSelector(url: image),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: name, style: TextStyle(fontSize: 24)),
                if (isSubscribed) WidgetSpan(child: Icon(Icons.verified, color: context.appColors.onSurface)),
                WidgetSpan(
                  child: Container(
                    margin: .symmetric(horizontal: 10),
                    padding: .symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: context.appColors.primary, borderRadius: .circular(10)),
                    child: Text(widget.profile.type.toString(), style: TextStyle(color: context.appColors.onPrimary)),
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.white70),
              children: [TextSpan(text: "Balans: $balance")],
            ),
          ),
        ],
      ),
    ),
    desktopBuilder: (_, _) => Row(
      crossAxisAlignment: .center,
      spacing: 10,
      children: [
        AvatarSelector(url: image),
        Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: name, style: TextStyle(fontSize: 24)),
                  if (isSubscribed) WidgetSpan(child: Icon(Icons.verified, color: context.appColors.onSurface)),
                  WidgetSpan(
                    child: Container(
                      margin: .symmetric(horizontal: 10),
                      padding: .symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: context.appColors.primary, borderRadius: .circular(10)),
                      child: Text(widget.profile.type.toString(), style: TextStyle(color: context.appColors.onPrimary)),
                    ),
                  ),
                ],
              ),
            ),
            Text("Balans: $balance", style: TextStyle(fontSize: 16, color: Colors.white70)),
          ],
        ),
        Expanded(child: Container()),
        IconButton(onPressed: () => profileController.refreshAll(), icon: Icon(Icons.refresh)),
        IconButton(
          onPressed: () => tokenId != null ? showLogoutModal(context, tokenId: tokenId, isCurrent: true) : null,
          icon: Icon(Icons.exit_to_app),
        ),
        SizedBox(width: 30),
      ],
    ),
  );

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

  bool get isAnibla => widget.type.isAnibla;
}
