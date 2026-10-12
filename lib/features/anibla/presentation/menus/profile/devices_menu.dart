import 'package:application/features/anibla/data/models/data/session.dart';
import 'package:application/features/anibla/presentation/dialogs/logout_modal.dart';
import 'package:application/features/anibla/data/models/misc/device.dart';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/list.dart';
import 'package:flutter/material.dart';

class ProfileDevicesMenu extends StatelessWidget {
  final List<Session> sessions;
  final String tokenId;
  const ProfileDevicesMenu(this.sessions, this.tokenId, {super.key});

  @override
  Widget build(BuildContext context) => ListsWidget(
    items: sessions.map((e) {
      final isCurrent = tokenId == e.tokenId;
      final label = isCurrent ? "${e.device} - Ushbu qurilma" : e.device;
      return ListModel(
        label: label,
        value: "${DateTime.tryParse(e.lastLogin)?.formatFull()}-yil",
        icon: Device.fromString(e.platform).icon,
        actions: [
          if (!isCurrent)
            IconButton(
              onPressed: () => showLogoutModal(context, tokenId: e.tokenId, deviceName: e.device, isCurrent: false),
              icon: Icon(Icons.exit_to_app),
              color: context.appColors.error,
              mouseCursor: SystemMouseCursors.click,
            ),
        ],
      );
    }).toList(),
  );
}
