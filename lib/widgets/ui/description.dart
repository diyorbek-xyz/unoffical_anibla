import 'package:application/constants/colors.dart';
import 'package:application/models/anime.dart';
import 'package:application/widgets/ui/badge.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetDescription extends StatefulWidget {
  final Anime anime;
  const WidgetDescription({super.key, required this.anime});

  @override
  State<WidgetDescription> createState() => _WidgetDescriptionState();
}

class _WidgetDescriptionState extends State<WidgetDescription> {
  final compact = NumberFormat.compact(locale: "uz");

  bool _collapsed = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => _collapsed = !_collapsed),
      hoverColor: primaryTint,
      splashColor: primaryTint,
      highlightColor: primaryTint,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                WidgetBage(text: "${compact.format(widget.anime.views)} ko'rishlar"),
                WidgetBage(text: "${DateTime.now().year - widget.anime.year} years ago"),
                ...widget.anime.categories.map((category) => WidgetBage(text: category.title.uz)),
              ],
            ),
            Text(widget.anime.description.uz, overflow: TextOverflow.ellipsis, maxLines: _collapsed ? 3 : 999),
          ],
        ),
      ),
    );
  }
}
