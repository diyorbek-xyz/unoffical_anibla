import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/image_provider/fallback_provider.dart';
import 'package:application/features/profile/presentation/widget/modals/avatars_menu.dart';
import 'package:flutter/material.dart';

class AvatarSelector extends StatefulWidget {
  final String url;
  final bool isLoading;
  final String? fallback;
  const AvatarSelector({super.key, required this.url, this.fallback, required this.isLoading});

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .bottomEnd,
      clipBehavior: .none,
      children: [
        CircleAvatar(
          radius: 54,
          backgroundColor: context.appColors.primary,
          backgroundImage: widget.isLoading ? null : imageProviderFallback(widget.url),
          child: (widget.fallback != null) ? Text(widget.isLoading ? "N" : widget.fallback!, style: TextStyle(fontSize: 42)) : null,
        ),
        IconButton(
          onPressed: () => showAvatarsMenu(context),
          constraints: BoxConstraints.tightFor(height: 35, width: 35),
          padding: EdgeInsets.all(0),
          mouseCursor: SystemMouseCursors.click,
          color: context.appColors.onPrimary,
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(context.appColors.primary)),
          icon: Icon(Icons.edit),
        ),
      ],
    );
  }
}
