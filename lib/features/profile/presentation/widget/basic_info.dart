import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:application/features/profile/presentation/widget/modals/logout_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBasicInfo extends StatelessWidget {
  const ProfileBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state) {
          case ProfileSuccess():
            return Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  radius: 54,
                  backgroundImage: CachedNetworkImageProvider(state.data.image),
                  onBackgroundImageError: (exception, stackTrace) => "error",
                  child: Text(state.data.name[0], style: TextStyle(fontSize: 42)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "${state.data.name} ", style: TextStyle(fontSize: 24)),
                          if (state.data.subscription != null)
                            WidgetSpan(
                              child: Icon(Icons.verified, color: context.appColors.onSurface),
                            ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                        children: [TextSpan(text: "Balans: ${state.data.balance} so'm")],
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    IconButton(
                      onPressed: () =>
                          showLogoutModal(context, tokenId: state.data.tokenId, isCurrent: true),
                      icon: Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
              ],
            );
          default:
            return Text("Info");
        }
      },
    );
  }
}
