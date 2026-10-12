import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/misc/avatar.dart';
import 'package:application/features/anibla/presentation/controllers/profile_controller.dart';
import 'package:application/features/anibla/presentation/static/avatars.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void showAvatarsMenu(BuildContext context) => showDialog(context: context, builder: (context) => AvatarsMenu());

class AvatarsMenu extends StatefulWidget {
  const AvatarsMenu({super.key});

  @override
  State<AvatarsMenu> createState() => _AvatarsMenuState();
}

class _AvatarsMenuState extends State<AvatarsMenu> {
  List<int> selected = [-1, -1];
  void changeAvatar() {
    final avatar = "https://static.crunchyroll.com/assets/avatar/170x170/${models[selected[0]].assets[selected[1]].id}";
    context.controller<ProfileController>().changeProfile(url: avatar);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      constraints: BoxConstraints.expand(width: 700, height: 600),
      contentPadding: .all(0),
      actionsPadding: .all(15),
      actions: [
        OutlinedButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        FilledButton(onPressed: changeAvatar, child: Text("Confirm")),
      ],
      content: ListView.separated(
        padding: .symmetric(vertical: 20),
        separatorBuilder: (context, index) => SizedBox(height: 20, child: Divider(height: 1)),
        itemCount: models.length,
        physics: BouncingScrollPhysics(),
        addRepaintBoundaries: true,
        itemBuilder: (context, groupIndex) {
          final group = models[groupIndex];
          final isGroupSelected = selected[0] == groupIndex;
          return SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: .symmetric(horizontal: 20),
                  child: Text(
                    group.title,
                    style: context.textTheme.titleLarge?.copyWith(color: isGroupSelected ? context.appColors.secondary : null),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: .symmetric(horizontal: 20),
                    addRepaintBoundaries: true,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    shrinkWrap: true,
                    scrollDirection: .horizontal,
                    itemCount: group.assets.length,
                    itemBuilder: (context, index) {
                      final isSelected = isGroupSelected && selected[1] == index;
                      return GestureDetector(
                        onTap: () => setState(() => selected = [groupIndex, index]),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: .circle,
                              border: Border.all(
                                color: isSelected ? context.appColors.secondary : context.appColors.primary,
                                width: isSelected ? 4 : 2,
                                strokeAlign: 1,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: isSelected ? 55 : 50,
                              foregroundImage: CachedNetworkImageProvider(
                                "https://static.crunchyroll.com/assets/avatar/170x170/${group.assets[index].id}",
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

final models = avatars.map((e) => AvatarGroup.fromJson(e)).toList();
