import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/data/models/misc/device.dart';
import 'package:application/shared/widgets/list.dart';
import 'package:application/features/anibla/presentation/controllers/profile_controller.dart';
import 'package:application/features/anibla/presentation/dialogs/logout_modal.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ProfileDevicesMenu extends StatefulWidget {
  const ProfileDevicesMenu({super.key});

  @override
  State<ProfileDevicesMenu> createState() => _ProfileDevicesMenuState();
}

class _ProfileDevicesMenuState extends State<ProfileDevicesMenu> {
  final ProfileController profileController = sl<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (context) {
        final state = profileController.profileSignal.value;
        final data = state.value ?? profileController.fakeProfile;
        return ListsWidget(
          items: data.sessions.map((e) {
            final isCurrent = data.tokenId == e.tokenId;
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
      },
    );
  }
}
