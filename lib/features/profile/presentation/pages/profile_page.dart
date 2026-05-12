import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/profile/data/mapper/profile_mapper.dart';
import 'package:application/features/profile/data/models/profile_model.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:application/features/profile/presentation/bloc/session/session_bloc.dart';
import 'package:application/features/profile/presentation/widget/sessions.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/profile/presentation/pages/devices_menu.dart';
import 'package:application/features/profile/presentation/pages/infos_menu.dart';
import 'package:application/features/profile/presentation/pages/last_anime_menu.dart';
import 'package:application/features/profile/presentation/pages/saves_menu.dart';
import 'package:application/features/profile/presentation/widget/modals/logout_modal.dart';
import 'package:application/main.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TabModel {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const TabModel({
    required this.activeIcon,
    required this.icon,
    required this.label,
  });
}

final List<TabModel> tabs = [
  TabModel(
    activeIcon: Icons.info,
    icon: Icons.info_outline,
    label: "Profil ma'lumotlari",
  ),
  TabModel(
    activeIcon: Icons.history,
    icon: Icons.history,
    label: "So'ngi anime",
  ),
  TabModel(
    activeIcon: Icons.bookmark,
    icon: Icons.bookmark_outline,
    label: "Saqlangan animelar",
  ),
  TabModel(
    activeIcon: Icons.devices,
    icon: Icons.devices_outlined,
    label: "Qurilmalar",
  ),
  TabModel(
    activeIcon: Icons.verified,
    icon: Icons.verified_outlined,
    label: "Obunalar",
  ),
];

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 0;
  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
            return ErrorBuilder(
              message: state.message,
              refresh: () => context.read<ProfileBloc>().add(GetProfile()),
            );
          }
          if (state is ProfileLimitSession) {
            return SessionsFailureWidget(sessions: state.sessions);
          }
          if (state is ProfileSuccess || state is ProfileLoading) {
            final loading = state is ProfileLoading;
            return Skeletonizer(
              justifyMultiLineText: true,
              enableSwitchAnimation: true,
              effect: PulseEffect(
                duration: Duration(seconds: 1),
                from: context.appColors.primary,
                to: context.appColors.onPrimary,
              ),
              enabled: loading,
              child: mainView,
            );
          }
          return Text("Nimadur xato ketti");
        },
      ),
    );
  }

  Widget get mainView => BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      final isLoading = state is! ProfileSuccess;
      final fake = ProfileMapper.modelToEntity(ProfileModel());
      final data = isLoading ? fake : state.data;
      return DefaultTabController(
        length: tabs.length,
        child: LayoutBuilder(
          builder: (context, constraints) => Responsive(
            constraints: constraints,
            mobileWidth: MOBILE_WIDTH + 100,
            child: RefreshIndicator.adaptive(
              onRefresh: () async =>
                  context.read<ProfileBloc>().add(GetProfile()),
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  final responsive = Responsive.of(context);
                  final bottom = responsive.isMobile
                      ? TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.center,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: tabs
                              .map((e) => Tab(icon: Icon(e.icon)))
                              .toList(),
                        )
                      : null;
                  return [
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context,
                      ),
                      sliver: SliverAppBar.medium(
                        automaticallyImplyLeading: true,
                        scrolledUnderElevation: 0.0,
                        toolbarHeight: kToolbarHeight,
                        stretch: true,
                        centerTitle: false,
                        expandedHeight:
                            (responsive.isMobile ? 170 : 100) +
                            kTextTabBarHeight +
                            kToolbarHeight,
                        collapsedHeight:
                            kTextTabBarHeight +
                            kToolbarHeight +
                            MediaQuery.paddingOf(context).top,
                        title: Text(data.name),
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
                body: Builder(
                  builder: (context) {
                    final responsive = Responsive.of(context);

                    final views = [
                      ProfileInfosMenu(data: data),
                      ProfileLastAnimeMenu(profile: data),
                      SavesMenu(profile: data),
                      ProfileDevicesMenu(),
                      Text("obunalar"),
                    ];
                    final mobile = TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: views,
                    );
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
                      scrollBehavior: ScrollBehavior().copyWith(
                        scrollbars: false,
                      ),
                      key: const PageStorageKey("main"),
                      slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context,
                              ),
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
      );
    },
  );

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
        onTap: () => setCurrentIndex(index),
        tileColor: Colors.transparent,
        selected: selected,
        selectedTileColor: context.appColors.primaryFixed.withValues(
          alpha: 0.1,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 11),
        leading: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: selected
                ? context.appColors.primary
                : context.appColors.onPrimary,
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            tab.icon,
            color: selected
                ? context.appColors.onPrimary
                : context.appColors.primary,
          ),
        ),
      );
    },
  );

  Widget get basicInfo => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 20,
    ).add(EdgeInsetsGeometry.only(top: 40)),
    child: BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final isLoading = state is! ProfileSuccess;
        final fake = ProfileMapper.modelToEntity(ProfileModel());
        final data = isLoading ? fake : state.data;
        final responsive = Responsive.of(context);
        if (responsive.isMobile) {
          return Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .start,
            children: [
              CircleAvatar(
                radius: 54,
                backgroundColor: context.appColors.primary,
                backgroundImage: isLoading
                    ? null
                    : CachedNetworkImageProvider(data.image),
                child: Text(
                  isLoading ? "N" : data.name[0],
                  style: TextStyle(fontSize: 42),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: data.name, style: TextStyle(fontSize: 24)),
                    if (data.subscription != null)
                      WidgetSpan(
                        child: Icon(
                          Icons.verified,
                          color: context.appColors.onSurface,
                        ),
                      ),
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
        }
        return Row(
          crossAxisAlignment: .center,
          spacing: 10,
          children: [
            CircleAvatar(
              radius: 54,
              backgroundColor: context.appColors.primary,
              backgroundImage: isLoading
                  ? null
                  : CachedNetworkImageProvider(data.image),
              child: Text(
                isLoading ? "N" : data.name[0],
                style: TextStyle(fontSize: 42),
              ),
            ),
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: data.name, style: TextStyle(fontSize: 24)),
                      if (data.subscription != null)
                        WidgetSpan(
                          child: Icon(
                            Icons.verified,
                            color: context.appColors.onSurface,
                          ),
                        ),
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
            ),
            Expanded(child: Container()),
            IconButton(
              onPressed: () => showLogoutModal(
                context,
                tokenId: data.tokenId,
                isCurrent: true,
              ),
              icon: Icon(Icons.exit_to_app),
            ),
            SizedBox(width: 30),
          ],
        );
      },
    ),
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
          ElevatedButton(
            onPressed: () => context.pushNamed("login"),
            child: Text("Kirish"),
          ),
        ],
      ),
    );
  }
}
