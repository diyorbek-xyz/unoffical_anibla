import 'package:application/core/constants/colors.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/data/models/param_models/calendar_params.dart';
import 'package:application/domain/entities/other/calendar_entity.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_bloc.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_event.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_state.dart';
import 'package:application/presentation/model/calendar_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WidgetCalendar extends StatefulWidget {
  const WidgetCalendar({super.key});

  @override
  State<WidgetCalendar> createState() => _WidgetCalendarState();
}

class _WidgetCalendarState extends State<WidgetCalendar> {
  final today = DateTime.now();
  late final dates = List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: dates.length,
      child: Scaffold(
        appBar: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: Colors.white30,
          tabs: dates.map((date) => Tab(text: FormatDate.format(date).dynamicWeekday)).toList(),
        ),
        bottomSheet: TextButton(onPressed: () {}, child: Text('Ko\'proq')),
        body: BlocBuilder<RemoteCalendarBloc, RemoteCalendarState>(
          builder: (context, state) {
            if (state is RemoteCalendarFailed) {
              return Center(child: Text(state.exception.toString()));
            }
            if (state is RemoteCalendarDone || state is RemoteCalendarLoading) {
              final loading = state is RemoteCalendarLoading;
              return Skeletonizer(
                enabled: loading,
                enableSwitchAnimation: true,
                child: TabBarView(
                  clipBehavior: Clip.hardEdge,
                  children: dates.map((date) {
                    final timers = state.calendar?.releases ?? List.generate(2, (index) => TimerUiModel.fromEntity(TimerEntity()));
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(5),
                        child: Column(spacing: 10, children: timers.map((anime) => calenderCard(anime, loading)).toList()),
                      ),
                    );
                  }).toList(),
                ),
              );
            }
            return Text("data");
          },
        ),
      ),
    );
  }
}

Widget calenderCard(TimerUiModel timer, bool loading) {
  return SizedBox(
    height: 220,
    child: Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 6 / 8,
          child: Skeleton.replace(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(timer.anime.thumbnail)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: .end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.black54,
                    child: TimerCountdown(endTime: timer.releaseTime, spacerWidth: 1, enableDescriptions: false),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      timer.anime.title.uz,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Chiqish sanasi: ${FormatDate.format(timer.releaseTime).title}"),
                    Text("Soat: ${FormatDate.format(timer.releaseTime).time} da"),
                    Text("Qism: ${timer.episode.episodeNumber}-qism"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Row info(String title, String value) {
  return Row(
    spacing: 4,
    children: [
      Container(width: 5, height: 20, color: primaryDark),
      Text(title),
      Text(value),
    ],
  );
}
