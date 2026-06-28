import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/constants/spacings.dart';
import 'package:application/features/common/domain/entities/tab_item.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/profile/data/mapper/profile_mapper.dart';
import 'package:application/features/profile/data/models/profile/profile_model.dart';
import 'package:application/features/profile/presentation/bloc/notification/notification_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:application/features/profile/presentation/bloc/session/session_bloc.dart';
import 'package:application/features/profile/presentation/pages/notifications_menu.dart';
import 'package:application/features/profile/presentation/pages/privacy_settings.dart';
import 'package:application/features/profile/presentation/widget/avatar_selector.dart';
import 'package:application/features/profile/presentation/widget/sessions.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/profile/presentation/pages/devices_menu.dart';
import 'package:application/features/profile/presentation/pages/infos_menu.dart';
import 'package:application/features/profile/presentation/widget/modals/logout_modal.dart';
import 'package:application/main.dart';

final List<TabItem> tabs = [
  TabItem(activeIcon: Icons.info, icon: Icons.info_outline, label: "Profil ma'lumotlari"),
  TabItem(activeIcon: Icons.notifications, icon: Icons.notifications_outlined, label: "Bildirishnomalar"),
  TabItem(activeIcon: Icons.verified, icon: Icons.verified_outlined, label: "Obunalar"),
  TabItem(activeIcon: Icons.devices, icon: Icons.devices_outlined, label: "Qurilmalar"),
  TabItem(activeIcon: Icons.privacy_tip, icon: Icons.privacy_tip_outlined, label: "Xavfsizlik sozlamalari"),
];

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 0;
  void setCurrentIndex(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProfileBloc>()..add(GetProfile())),
        BlocProvider(create: (context) => sl<NotificationBloc>()..add(.get())),
        BlocProvider(create: (context) => sl<SessionBloc>()),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileUnauthorized) {
            return unauthorizedBuilder(context);
          }
          if (state is ProfileError) {
            return ErrorBuilder(message: state.message, refresh: () => context.read<ProfileBloc>().add(GetProfile()));
          }
          if (state is ProfileLimitSession) {
            return SessionsFailureWidget(sessions: state.sessions);
          }
          if (state is ProfileSuccess || state is ProfileLoading) {
            final loading = state is ProfileLoading;
            return Skeletonizer(
              justifyMultiLineText: true,
              effect: PulseEffect(duration: Duration(seconds: 1), from: context.appColors.primary, to: context.appColors.onPrimary),
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
            child: RefreshIndicator(
              onRefresh: () async => context.read<ProfileBloc>().add(GetProfile()),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast, parent: AlwaysScrollableScrollPhysics()),
                child: Builder(
                  builder: (context) {
                    final responsive = Responsive.of(context);
                    final views = [ProfileInfosMenu(data: data), NotificationsMenu(), Text("obunalar"), ProfileDevicesMenu(), PrivacySettings()];
                    final mobile = SizedBox(
                      height: 900,
                      child: Column(
                        mainAxisAlignment: .end,
                        spacing: 0,
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.only(top: appbarHeight, bottom: 20),
                            child: basicInfo,
                          ),
                          TabBar(
                            isScrollable: true,
                            tabAlignment: TabAlignment.center,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: tabs.map((e) => Tab(icon: Icon(e.icon))).toList(),
                          ),
                          Expanded(
                            child: TabBarView(physics: BouncingScrollPhysics(), children: views),
                          ),
                        ],
                      ),
                    );
                    final desktop = Padding(
                      padding: EdgeInsetsGeometry.all(containerPadding),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsetsGeometry.only(bottom: 20), child: basicInfo),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 20,
                            children: [
                              Expanded(flex: 1, child: customTabs),
                              Expanded(flex: 2, child: views[currentIndex]),
                            ],
                          ),
                        ],
                      ),
                    );
                    return responsive.isMobile ? mobile : desktop;
                  },
                ),
              ),
            ),
          ),
        ),
      );
    },
  );

  Widget get customTabs => Column(
    spacing: 5,
    children: tabs.asMap().entries.map((e) {
      final tab = e.value;
      final index = e.key;
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
    }).toList(),
  );

  Widget get basicInfo => BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      final isLoading = state is! ProfileSuccess;
      final fake = ProfileMapper.modelToEntity(ProfileModel());
      final data = isLoading ? fake : state.data;
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
              onPressed: () => showLogoutModal(context, tokenId: data.tokenId, isCurrent: true),
              icon: Icon(Icons.exit_to_app),
            ),
            SizedBox(width: 30),
          ],
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20).add(EdgeInsetsGeometry.only(top: responsive.isMobile ? 0 : 40)),
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
