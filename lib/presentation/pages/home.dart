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
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final params = const GetAnimesParams(limit: 10, page: 1);
  late final dates = List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<RemoteAnimesListBloc>()..add(GetAnimesList(params))),
        BlocProvider(create: (_) => sl<RemoteCalendarBloc>()..add(GetCalendar(dates))),
        BlocProvider(create: (_) => sl<RemoteCarouselBloc>()..add(GetCarouselItems())),
      ],
      child: RefreshIndicator.adaptive(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          sl<RemoteAnimesListBloc>().add(RefreshAnimesList(params));
          sl<RemoteCalendarBloc>().add(GetCalendar(dates));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  final width = MediaQuery.of(context).size.width;
                  if (width > 1100) {
                    return Row(
                      children: [
                        Expanded(child: SizedBox(height: 500, child: WidgetCarousel())),
                        SizedBox(width: 450, height: 500, child: WidgetCalendar()),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      SizedBox(height: max(width / 2, 400), child: WidgetCarousel()),
                      SizedBox(height: clampDouble(width * 0.9, 420, 500), child: WidgetCalendar()),
                    ],
                  );
                },
              ),
              BlocBuilder<RemoteAnimesListBloc, RemoteAnimesListState>(
                builder: (context, state) {
                  if (state is RemoteAnimesListFailed) {
                    return SizedBox(
                      height: 500,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text((state.exception?.error ?? "Nimadur xato ketti.").toString()),
                            ElevatedButton.icon(
                              onPressed: () => context.read<RemoteAnimesListBloc>().add(RefreshAnimesList(params)),
                              icon: Icon(Icons.replay_outlined),
                              label: Text("Yanglilash"),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  if (state is RemoteAnimesListDone || state is RemoteAnimesListLoading) {
                    final animes = state.animes ?? List.generate(12, (index) => AnimeUiModel.fromEntity(AnimeEntity()));
                    return Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: SizedBox(
                        child: Skeletonizer(
                          effect: PulseEffect(from: Colors.white, to: Colors.white10),
                          enabled: state is RemoteAnimesListLoading,
                          enableSwitchAnimation: true,
                          justifyMultiLineText: true,
                          textBoneBorderRadius: TextBoneBorderRadius(BorderRadiusGeometry.circular(5)),
                          child: ResponsiveGridList(
                            minItemWidth: 180,
                            minItemsPerRow: 2,
                            maxItemsPerRow: 6,
                            verticalGridSpacing: 10,
                            horizontalGridSpacing: 0,
                            listViewBuilderOptions: ListViewBuilderOptions(physics: NeverScrollableScrollPhysics(), shrinkWrap: true),
                            children: animes.map((anime) => WidgetAnimeCard(anime: anime)).toList(),
                          ),
                        ),
                      ),
                    );
                  }
                  return Text('no data');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
