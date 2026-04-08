import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/calendar/domain/entities/calendar_entity.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_event.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_state.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CalendarBloc>()..add(GetCalendarWeekly()),
      child: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          if (state is CalendarWeeklySuccess) {
            return main(state, context);
          }
          if (state is CalendarError) {
            return Text(state.message);
          }
          if (state is CalendarLoading) {
            return CircularProgressIndicator.adaptive();
          }
          return Text("loaded");
        },
      ),
    );
  }

  Padding main(CalendarWeeklySuccess state, BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        vertical: 10,
      ).add(EdgeInsetsGeometry.only(right: 10, top: 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kunlik chiqadigan Animelar ro'yxati",
            style: TextStyle(fontSize: 30),
          ),
          Text("1-haftalik", style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 20,
              children: state.data.map((e) => dailyAnimes(e, context)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Column dailyAnimes(CalendarEntity? e, BuildContext context) {
    final outerRadius = Radius.circular(15);
    final innerRadius = Radius.circular(5);
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: .min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: context.appColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: innerRadius,
              bottomRight: outerRadius,
              topLeft: outerRadius,
              topRight: outerRadius,
            ),
          ),
          child: Text(
            "${e?.date.formatDynamicWeeks().toUpperCase()}",
            style: TextStyle(color: context.appColors.onPrimary),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: context.appColors.primaryContainer,
            ),
            borderRadius: BorderRadius.only(
              topLeft: innerRadius,
              bottomLeft: outerRadius,
              bottomRight: outerRadius,
              topRight: outerRadius,
            ),
          ),
          padding: EdgeInsets.all(5),
          child: (e != null && e.timers.isNotEmpty)
              ? Row(
                  spacing: 10,
                  children: e.timers.map((timer) {
                    final episode = timer.episode.episodeNumber;
                    final hasEpisode = episode != 0;
                    return Badge(
                      label: Text(
                        "${timer.time.formatTime()}${hasEpisode ? "\t/\t$episode-qism" : ""} ",
                      ),
                      alignment: AlignmentGeometry.topLeft,
                      offset: Offset(6, 12),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      textStyle: TextStyle(fontSize: 16),
                      child: AnimeCard(anime: timer.anime),
                    );
                  }).toList(),
                )
              : SizedBox(
                  width: 180,
                  child: AspectRatio(
                    aspectRatio: 9 / 15,
                    child: Center(
                      child: Text(
                        "Hosizrcha bu kunda hech qanday anime rejalashtirilmagan",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
