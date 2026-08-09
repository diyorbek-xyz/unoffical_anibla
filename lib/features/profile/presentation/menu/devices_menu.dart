import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:application/features/profile/data/models/device_model.dart';
import 'package:application/features/profile/presentation/controller/profile_controller.dart';
import 'package:application/features/profile/presentation/widget/modals/logout_modal.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ProfileDevicesMenu extends StatefulWidget {
  const ProfileDevicesMenu({super.key});

  @override
  State<ProfileDevicesMenu> createState() => _ProfileDevicesMenuState();
}

class _ProfileDevicesMenuState extends State<ProfileDevicesMenu> {
  late final ProfileController profileController;
  @override
  void initState() {
    super.initState();
    profileController = sl<ProfileController>();
  }

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
              value: "${e.lastLogin.formatFull()}-yil",
              icon: Device.getDeviceIcon(Device.fromString(e.platform)),
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
