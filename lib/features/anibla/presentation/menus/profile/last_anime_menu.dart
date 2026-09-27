import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:application/features/anibla/presentation/widgets/anime_card.dart';
import 'package:flutter/material.dart';

class ProfileLastAnimeMenu extends StatefulWidget {
  final Profile profile;
  const ProfileLastAnimeMenu({super.key, required this.profile});

  @override
  State<ProfileLastAnimeMenu> createState() => _ProfileLastAnimeMenuState();
}

class _ProfileLastAnimeMenuState extends State<ProfileLastAnimeMenu> {
  @override
  Widget build(BuildContext context) {
    return AnimeCard(anime: widget.profile.lastAnime, expand: true, aspectRatio: 15 / 9);
  }
}
