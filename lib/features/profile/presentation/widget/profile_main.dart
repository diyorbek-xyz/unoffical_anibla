import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/profile/domain/entities/profile_entity.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:application/features/profile/presentation/pages/devices_menu.dart';
import 'package:application/features/profile/presentation/pages/infos_menu.dart';
import 'package:application/features/profile/presentation/pages/last_anime_menu.dart';
import 'package:application/features/profile/presentation/pages/saves_menu.dart';
import 'package:application/features/profile/presentation/widget/modals/logout_modal.dart';
import 'package:application/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabModel {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const TabModel({required this.activeIcon, required this.icon, required this.label});
}

final List<TabModel> tabs = [
  TabModel(activeIcon: Icons.info, icon: Icons.info_outline, label: "Profil ma'lumotlari"),
  TabModel(activeIcon: Icons.history, icon: Icons.history, label: "So'ngi anime"),
  TabModel(activeIcon: Icons.bookmark, icon: Icons.bookmark_outline, label: "Saqlangan animelar"),
  TabModel(activeIcon: Icons.devices, icon: Icons.devices_outlined, label: "Qurilmalar"),
  TabModel(activeIcon: Icons.verified, icon: Icons.verified_outlined, label: "Obunalar"),
];

class ProfileMain extends StatefulWidget {
  final ProfileEntity data;
  const ProfileMain({super.key, required this.data});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  int currentIndex = 0;
  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: LayoutBuilder(
        builder: (context, constraints) => Responsive(
          constraints: constraints,
          mobileWidth: MOBILE_WIDTH + 100,
          child: RefreshIndicator.adaptive(
            onRefresh: () async => context.read<ProfileBloc>().add(GetProfile()),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                final responsive = Responsive.of(context);
                final bottom = responsive.isMobile
                    ? TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.center,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: tabs.map((e) => Tab(icon: Icon(e.icon))).toList(),
                      )
                    : null;
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverAppBar.medium(
                      automaticallyImplyLeading: true,
                      scrolledUnderElevation: 0.0,
                      toolbarHeight: kToolbarHeight,
                      stretch: true,
                      centerTitle: false,
                      expandedHeight:
                          (responsive.isMobile ? 170 : 100) + kTextTabBarHeight + kToolbarHeight,
                      collapsedHeight:
                          kTextTabBarHeight + kToolbarHeight + MediaQuery.paddingOf(context).top,
                      title: Text(widget.data.name),
                      forceElevated: innerBoxIsScrolled,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: basicInfo,
                      ),
                      bottom: bottom,
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(
                  builder: (context) {
                    final responsive = Responsive.of(context);
                    final views = [
                      ProfileInfosMenu(data: widget.data),
                      ProfileLastAnimeMenu(profile: widget.data),
                      SavesMenu(profile: widget.data),
                      ProfileDevicesMenu(),
                      Text("obunalar"),
                    ];
                    final mobile = TabBarView(physics: BouncingScrollPhysics(), children: views);
                    final desktop = Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 50,
                      children: [
                        Expanded(flex: 1, child: customTabs),
                        Expanded(
                          flex: 2,
                          child: IndexedStack(
                            sizing: StackFit.loose,
                            index: currentIndex,
                            children: views,
                          ),
                        ),
                      ],
                    );
                    return CustomScrollView(
                      scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
                      key: const PageStorageKey("main"),
                      slivers: [
                        SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        responsive.isMobile
                            ? SliverFillRemaining(child: mobile)
                            : SliverToBoxAdapter(child: desktop),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Builder(
      builder: (context) {
        final responsive = Responsive.of(context);
        final views = [
          ProfileInfosMenu(data: widget.data),
          ProfileLastAnimeMenu(profile: widget.data),
          SavesMenu(profile: widget.data),
          ProfileDevicesMenu(),
          Text("obunalar"),
        ];
        if (responsive.isMobile) {
          return Column(children: views);
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 50,
          children: [
            Expanded(flex: 4, child: customTabs),
            Expanded(
              flex: 7,
              child: IndexedStack(sizing: StackFit.loose, index: currentIndex, children: views),
            ),
          ],
        );
      },
    );
  }

  Widget get customTabs => ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: tabs.length,
    separatorBuilder: (context, index) => SizedBox(height: 2),
    itemBuilder: (context, index) {
      TabModel tab = tabs[index];
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
          child: Icon(
            tab.icon,
            color: selected ? context.appColors.onPrimary : context.appColors.primary,
          ),
        ),
      );
    },
  );

  Widget get basicInfo => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Builder(
      builder: (context) {
        final responsive = Responsive.of(context);
        if (responsive.isMobile) {
          return Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .start,
            children: [
              CircleAvatar(
                radius: 54,
                backgroundImage: CachedNetworkImageProvider(widget.data.image),
                onBackgroundImageError: (exception, stackTrace) => "error",
                child: Text(widget.data.name[0], style: TextStyle(fontSize: 42)),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "${widget.data.name} ", style: TextStyle(fontSize: 24)),
                    if (widget.data.subscription != null)
                      WidgetSpan(child: Icon(Icons.verified, color: context.appColors.onSurface)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                  children: [TextSpan(text: "Balans: ${widget.data.balance} so'm")],
                ),
              ),
            ],
          );
        }
        return Row(
          crossAxisAlignment: .center,
          spacing: 10,
          children: [
            CircleAvatar(
              radius: 54,
              backgroundImage: CachedNetworkImageProvider(widget.data.image),
              onBackgroundImageError: (exception, stackTrace) => "error",
              child: Text(widget.data.name[0], style: TextStyle(fontSize: 42)),
            ),
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "${widget.data.name} ", style: TextStyle(fontSize: 24)),
                      if (widget.data.subscription != null)
                        WidgetSpan(child: Icon(Icons.verified, color: context.appColors.onSurface)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    children: [TextSpan(text: "Balans: ${widget.data.balance} so'm")],
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            IconButton(
              onPressed: () =>
                  showLogoutModal(context, tokenId: widget.data.tokenId, isCurrent: true),
              icon: Icon(Icons.exit_to_app),
            ),
            SizedBox(width: 30),
          ],
        );
      },
    ),
  );
}
