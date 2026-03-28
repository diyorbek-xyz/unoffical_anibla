import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/calendar/domain/entities/timer_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerWidget extends StatelessWidget {
  final TimerEntity timer;
  const TimerWidget({super.key, required this.timer});
  void _showCustomMenu(
    BuildContext context,
    Offset position, {
    required List<PopupMenuEntry<String>> items,
  }) {
    final RelativeRect positionRect = RelativeRect.fromLTRB(
      position.dx - 70,
      position.dy,
      MediaQuery.of(context).size.width - position.dx + 20,
      MediaQuery.of(context).size.height - position.dy,
    );

    showMenu<String>(context: context, position: positionRect, items: items, elevation: 8.0);
  }

  void handleClick(BuildContext context, Offset position) => _showCustomMenu(
    context,
    position,
    items: [
      PopupMenuItem(
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(spacing: 10, children: [Icon(Icons.bookmark), Text("Saqlash")]),
      ),
      PopupMenuItem(
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(spacing: 10, children: [Icon(Icons.bookmark), Text("Saqlash")]),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: AspectRatio(
        aspectRatio: 9 / 15,
        child: GestureDetector(
          onSecondaryTapDown: (details) => handleClick(context, details.globalPosition),
          onLongPressStart: (details) => handleClick(context, details.globalPosition),
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            onTap: () {},
            splashColor: context.appColors.surfaceContainerLowest.withValues(alpha: 0.2),
            hoverColor: context.appColors.surfaceContainerLowest.withValues(alpha: 0.2),
            highlightColor: Colors.transparent,
            focusColor: context.appColors.surfaceContainerLowest.withValues(alpha: 0.2),
            radius: 350,
            child: Badge(
              label: Text(timer.time.formatTime()),
              alignment: AlignmentGeometry.topLeft,
              offset: Offset(6, 12),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              textStyle: TextStyle(fontSize: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 12,
                    child: Ink(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: context.appColors.surfaceContainerLowest,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(addBaseUrl(timer.anime['thumbnail'])),
                          fit: BoxFit.cover,
                          alignment: AlignmentGeometry.center,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  Text(
                    toBeginningOfSentenceCase(timer.anime['uz']['title']),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
