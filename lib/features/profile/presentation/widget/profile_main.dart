import 'package:application/core/constants/theme.dart';
import 'package:application/features/profile/domain/entities/account_entity.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:application/features/profile/presentation/widget/tabs/infos.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabModel {
  final Icon icon;
  final Icon activeIcon;
  final String label;
  const TabModel({required this.activeIcon, required this.icon, required this.label});
}

final List<TabModel> tabs = [
  TabModel(
    activeIcon: Icon(Icons.info),
    icon: Icon(Icons.info_outline),
    label: "Profil ma'lumotlari",
  ),
  TabModel(activeIcon: Icon(Icons.history), icon: Icon(Icons.history), label: "So'ngi anime"),
  TabModel(
    activeIcon: Icon(Icons.bookmark),
    icon: Icon(Icons.bookmark_outline),
    label: "Saqlangan animelar",
  ),
  TabModel(
    activeIcon: Icon(Icons.devices),
    icon: Icon(Icons.devices_outlined),
    label: "Qurilmalar",
  ),
  TabModel(
    activeIcon: Icon(Icons.verified),
    icon: Icon(Icons.verified_outlined),
    label: "Obunalar",
  ),
];

class ProfileMain extends StatefulWidget {
  final AccountEntity data;
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
    return RefreshIndicator.adaptive(
      onRefresh: () async => context.read<ProfileBloc>().add(GetProfile()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: double.infinity,
        child: Column(spacing: 30, children: [basicInfo(), menu()]),
      ),
    );
  }

  Row menu() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            children: tabs.map((e) {
              int index = tabs.indexOf(e);
              return ListTile(
                title: Text(e.label),
                onTap: () => setCurrentIndex(index),
                tileColor: Colors.transparent,
                hoverColor: primaryTint.withValues(alpha: 0.05),
                focusColor: primaryTint.withValues(alpha: 0.05),
                splashColor: primaryTint.withValues(alpha: 0.05),
                selected: index == currentIndex,
                selectedTileColor: primaryTint,
                leading: e.icon,
              );
            }).toList(),
          ),
        ),
        Expanded(
          flex: 7,
          child: IndexedStack(
            index: currentIndex,
            children: [
              InfosMenu(data: widget.data),
              Text("songi"),
              Text("saqlangan"),
              Text("qurilmalar"),
              Text("obunalar"),
            ],
          ),
        ),
      ],
    );
  }

  Row basicInfo() {
    return Row(
      spacing: 10,
      children: [
        CircleAvatar(
          radius: 54,
          backgroundImage: CachedNetworkImageProvider(widget.data.image),
          onBackgroundImageError: (exception, stackTrace) => "error",
          child: Text(widget.data.name[0], style: TextStyle(fontSize: 42)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "${widget.data.name} ", style: TextStyle(fontSize: 24)),
                  if (widget.data.subscription != null)
                    WidgetSpan(child: Icon(Icons.verified, color: onSurface)),
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
        Column(
          children: [IconButton(onPressed: () => {}, icon: Icon(Icons.exit_to_app))],
        ),
      ],
    );
  }
}
