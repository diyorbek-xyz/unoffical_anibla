import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter/material.dart';

class ProfileLastAnimeMenu extends StatefulWidget {
  final ProfileEntity profile;
  const ProfileLastAnimeMenu({super.key, required this.profile});

  @override
  State<ProfileLastAnimeMenu> createState() => _ProfileLastAnimeMenuState();
}

class _ProfileLastAnimeMenuState extends State<ProfileLastAnimeMenu> {
  @override
  Widget build(BuildContext context) {
    return AnimeCard(
      anime: widget.profile.lastAnime,
      expand: true,
      aspectRatio: 15 / 9,
    );
  }
}
