import 'dart:math';

import 'package:application/core/utils/utils.dart';
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
    return DecoratedBox(
      decoration: BoxDecoration(color: ColorScheme.of(context).surface),
      child: DefaultTabController(
        initialIndex: 0,
        length: dates.length,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.white30,
                    tabs: dates.map((date) => Tab(text: FormatDate.format(date).dynamicWeekday)).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<RemoteCalendarBloc, RemoteCalendarState>(
                builder: (context, state) {
                  if (state is RemoteCalendarFailed) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Text((state.exception?.error ?? "Nimadur xato ketti.").toString()),
                          ElevatedButton.icon(
                            onPressed: () => context.read<RemoteCalendarBloc>().add(GetCalendar(dates)),
                            icon: Icon(Icons.replay_outlined),
                            label: Text("Yanglilash"),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is RemoteCalendarDone || state is RemoteCalendarLoading) {
                    final loading = state is RemoteCalendarLoading;
                    return Skeletonizer(
                      enabled: loading,
                      effect: PulseEffect(from: Colors.white, to: Colors.white10),
                      enableSwitchAnimation: true,
                      child: TabBarView(
                        clipBehavior: Clip.hardEdge,
                        children: state.list!.map((calendar) {
                          if (calendar.releases.isEmpty) {
                            return Padding(
                              padding: EdgeInsetsGeometry.only(left: 5, right: 5, top: 5),
                              child: Center(child: Text("Bu kunda hech qanday anime rejalashtirilmagan")),
                            );
                          }
                          return Padding(
                            padding: EdgeInsetsGeometry.only(left: 5, right: 5, top: 5),
                            child: Column(
                              spacing: 5,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: calendar.releases
                                  .getRange(0, min(calendar.releases.length, 2))
                                  .map((anime) => calenderCard(anime, loading))
                                  .toList(),
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
          ],
        ),
      ),
    );
  }
}

Widget calenderCard(TimerUiModel timer, bool loading) {
  return FractionallySizedBox(
    heightFactor: 0.5,
    child: GestureDetector(
      onTap: () {},
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
                      child: TimerCountdown(
                        endTime: timer.releaseTime,
                        spacerWidth: 1,
                        timeTextStyle: TextStyle(fontSize: 20),
                        enableDescriptions: false,
                      ),
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
                children: [_animeInfo(timer)],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Builder _animeInfo(TimerUiModel timer) {
  return Builder(
    builder: (context) {
      final width = MediaQuery.of(context).size.width;
      final fontSize = width > 700 ? 16.0 : 14.0;
      return Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            timer.anime.title.uz,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: width > 700 ? 20 : 16, fontWeight: FontWeight.bold),
          ),
          Text("Chiqish sanasi: ${FormatDate.format(timer.releaseTime).title}", style: TextStyle(fontSize: fontSize)),
          Text("Soat: ${FormatDate.format(timer.releaseTime).time} da", style: TextStyle(fontSize: fontSize)),
          Text("Qism: ${timer.episode.episodeNumber}-qism", style: TextStyle(fontSize: fontSize)),
        ],
      );
    },
  );
}
