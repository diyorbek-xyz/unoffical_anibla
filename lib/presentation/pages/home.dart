import 'dart:math';
import 'dart:ui';
import 'package:application/data/models/param_models/anime_params.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_bloc.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_event.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_state.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_bloc.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_event.dart';
import 'package:application/presentation/bloc/carousel/remote/remote_carousel_bloc.dart';
import 'package:application/presentation/bloc/carousel/remote/remote_carousel_event.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:application/presentation/widgets/ui/anime_card.dart';
import 'package:application/presentation/widgets/ui/calendar.dart';
import 'package:application/presentation/widgets/ui/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const _limit = 10;
  static const _skeletonCount = 12;
  static const _desktopWidth = 1100;
  static const double _carouselHeight = 500;
  static const double _calendarWidth = 450;

  late final params = const GetAnimesParams(type: "movies", from: "mobile", limit: _limit, page: 1);
  late final dates = List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<RemoteAnimesListBloc>()..add(GetAnimesList(params))),
        BlocProvider(create: (_) => sl<RemoteCalendarBloc>()..add(GetCalendar(dates))),
        BlocProvider(create: (_) => sl<RemoteCarouselBloc>()..add(GetCarouselItems())),
      ],
      child: BlocBuilder<RemoteAnimesListBloc, RemoteAnimesListState>(
        builder: (context, state) {
          return RefreshIndicator.adaptive(
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              context.read<RemoteAnimesListBloc>().add(RefreshAnimesList(params));
              context.read<RemoteCalendarBloc>().add(GetCalendar(dates));
              context.read<RemoteCarouselBloc>().add(GetCarouselItems());
            },
            child: SingleChildScrollView(child: Column(children: [_buildCarouselSection(), _buildAnimesList()])),
          );
        },
      ),
    );
  }

  Widget _buildCarouselSection() => Builder(
    builder: (context) {
      final width = MediaQuery.of(context).size.width;
      if (width > _desktopWidth) {
        return Row(
          children: [
            Expanded(
              child: SizedBox(height: _carouselHeight, child: const WidgetCarousel()),
            ),
            SizedBox(width: _calendarWidth, height: _carouselHeight, child: const WidgetCalendar()),
          ],
        );
      }
      return Column(
        children: [
          SizedBox(height: max(width / 2, 400), child: const WidgetCarousel()),
          SizedBox(height: clampDouble(width * 0.9, 420, 500), child: const WidgetCalendar()),
        ],
      );
    },
  );

  Widget _buildAnimesList() => BlocBuilder<RemoteAnimesListBloc, RemoteAnimesListState>(
    builder: (context, state) {
      if (state is RemoteAnimesListFailed) {
        return _buildErrorState(context, state);
      }
      if (state is RemoteAnimesListDone || state is RemoteAnimesListLoading) {
        final animes = state.animes ?? List.generate(_skeletonCount, (i) => AnimeUiModel.fromEntity(AnimeEntity()));
        return _buildAnimesGrid(animes, state is RemoteAnimesListLoading);
      }
      return const Text('no data');
    },
  );

  Widget _buildErrorState(BuildContext context, RemoteAnimesListFailed state) => SizedBox(
    height: 500,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text((state.exception?.error ?? "Nimadur xato ketti.").toString()),
          ElevatedButton.icon(
            onPressed: () => context.read<RemoteAnimesListBloc>().add(RefreshAnimesList(params)),
            icon: const Icon(Icons.replay_outlined),
            label: const Text("Yanglilash"),
          ),
        ],
      ),
    ),
  );

  Widget _buildAnimesGrid(List<AnimeUiModel> animes, bool isLoading) => Skeletonizer(
    enabled: isLoading,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: animes.map((anime) => WidgetAnimeCard(anime: anime)).toList()),
      ),
    ),
  );
}

class _RecommendBuilder extends StatefulWidget {
  final String? categoryId;
  final String? genreId;
  const _RecommendBuilder({super.key, this.categoryId, this.genreId});

  @override
  State<_RecommendBuilder> createState() => __RecommendBuilderState();
}

class __RecommendBuilderState extends State<_RecommendBuilder> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
