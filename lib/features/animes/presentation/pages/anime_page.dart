import 'dart:ui';

import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_event.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/bloc/season/season_bloc.dart';
import 'package:application/features/animes/presentation/bloc/season/season_event.dart';
import 'package:application/features/animes/presentation/bloc/season/season_state.dart';
import 'package:application/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AnimePage extends StatelessWidget {
  final String slug;
  const AnimePage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AnimeBloc>()..add(GetSerie(slug))),
        BlocProvider(create: (context) => sl<SeasonBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AnimeBloc, AnimeState>(
            listener: (context, state) {
              if (state is AnimeSuccess) {
                context.read<SeasonBloc>().add(GetAllSeasons(state.anime.slug));
              }
            },
          ),
          BlocListener<SeasonBloc, SeasonState>(
            listener: (context, state) {
              if (state is SeasonSuccess) print(state.seasons.toString());
            },
          ),
        ],
        child: Builder(builder: bodyBuilder),
      ),
    );
  }

  Scaffold bodyBuilder(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: BlocBuilder<AnimeBloc, AnimeState>(
          builder: (context, state) {
            if (state is AnimeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is AnimeFilure) {
              return Column(
                children: [
                  Text(state.message),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<AnimeBloc>().add(GetSerie(slug)),
                    child: Text("Refresh"),
                  ),
                ],
              );
            }
            if (state is AnimeSuccess) {
              final size = MediaQuery.of(context).size;
              return Container(
                padding: EdgeInsets.only(top: 60),
                width: double.infinity,
                constraints: BoxConstraints(minHeight: size.height),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(state.anime.cover),
                    fit: BoxFit.cover,
                    alignment: AlignmentGeometry.topCenter,
                    opacity: 0.5,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        animeInfoHero(context, state.anime)
                      ],
                    ),
                  ),
                ),
              );
            }
            return Text("");
          },
        ),
      ),
    );
  }

  Widget animeInfoHero(BuildContext context, AnimeEntity anime) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 20,
      children: [
        SizedBox(
          width: 200,
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: CachedNetworkImage(
              imageUrl: anime.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: context.appColors.primary,
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(anime.title.uz, style: context.textTheme.headlineMedium),
              Row(
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: Text("Ko'rishni boshlash"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    final state = context.watch<AnimeBloc>().state;
    final data = state is AnimeSuccess ? state.anime : null;
    final error = state is AnimeFilure ? state.message : null;
    return AppBar(
      title: Text("Anime: ${data?.title.uz ?? error ?? "Loading..."}"),
      backgroundColor: context.appColors.surface.withAlpha(200),
      toolbarHeight: 60,
    );
  }
}
