import 'package:application/data/models/param_models/anime_params.dart';
import 'package:application/data/models/param_models/calendar_params.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_bloc.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_event.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_state.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_bloc.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_event.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:application/presentation/widgets/ui/anime_card.dart';
import 'package:application/presentation/widgets/ui/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

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
        BlocProvider(create: (_) => sl<RemoteCalendarBloc>()..add(GetCalendar(CalendarParams(DateTime.now())))),
      ],
      child: BlocBuilder<RemoteAnimesListBloc, RemoteAnimesListState>(
        builder: (context, state) {
          if (state is RemoteAnimesListFailed) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(state.exception!.error.toString()),
                  ElevatedButton.icon(
                    onPressed: () => context.read<RemoteAnimesListBloc>().add(RefreshAnimesList(params)),
                    icon: Icon(Icons.replay_outlined),
                    label: Text("Yanglilash"),
                  ),
                ],
              ),
            );
          }
          if (state is RemoteAnimesListDone || state is RemoteAnimesListLoading) {
            final animes = state.animes ?? List.generate(12, (index) => AnimeUiModel.fromEntity(AnimeEntity()));
            return RefreshIndicator.adaptive(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: () async {
                context.read<RemoteAnimesListBloc>().add(RefreshAnimesList(params));
                dates.map((e) => context.read<RemoteCalendarBloc>().add(GetCalendar(CalendarParams(e))));
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
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
                      SizedBox(height: 600, child: WidgetCalendar()),
                    ],
                  ),
                ),
              ),
            );
          }
          return Text('no data');
        },
      ),
    );
  }
}
