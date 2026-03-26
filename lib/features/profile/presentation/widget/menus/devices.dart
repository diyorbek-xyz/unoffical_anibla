import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:application/features/profile/data/models/device_model.dart';
import 'package:application/features/profile/domain/entities/session_entity.dart';
import 'package:application/features/profile/presentation/widget/modals/logout_modal.dart';
import 'package:flutter/material.dart';

class ProfileDevicesMenu extends StatefulWidget {
  final List<SessionEntity> sessions;
  final String currentId;
  const ProfileDevicesMenu({super.key, required this.sessions, required this.currentId});

  @override
  State<ProfileDevicesMenu> createState() => _ProfileDevicesMenuState();
}

class _ProfileDevicesMenuState extends State<ProfileDevicesMenu> {
  @override
  Widget build(BuildContext context) {
    return ListsWidget(
      items: widget.sessions.map((e) {
        final isCurrent = widget.currentId == e.tokenId;
        final label = isCurrent ? "${e.device} - Ushbu qurilma" : e.device;
        return ListModel(
          label: label,
          value: "${e.lastLogin.formatFull()}-yil",
          icon: Device.getDeviceIcon(Device.fromString(e.platform)),
          actions: [
            if (!isCurrent)
              IconButton(
                onPressed: () => showLogoutModal(
                  context,
                  tokenId: e.tokenId,
                  deviceName: e.device,
                  isCurrent: false,
                ),
                icon: Icon(Icons.exit_to_app),
                color: context.appColors.error,
                mouseCursor: SystemMouseCursors.click,
              ),
          ],
        );
      }).toList(),
    );
  }
}
