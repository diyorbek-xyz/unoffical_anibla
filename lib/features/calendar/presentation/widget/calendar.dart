import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/calendar/data/mapper/calendar_mapper.dart';
import 'package:application/features/calendar/data/models/calendar_model.dart';
import 'package:application/features/calendar/data/models/timer_model.dart';
import 'package:application/features/calendar/domain/entities/calendar_entity.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_event.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_state.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: BlocProvider(
        create: (context) => sl<CalendarBloc>()..add(GetCalendarWeekly()),
        child: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
            final isLoading = state is! CalendarWeeklySuccess;
            final fakeTimers = List.generate(2, (index) => TimerModel(anime: AnimeModel(uz: {"title": lorem(20), "description": lorem()})));
            final fake = List.generate(7, (index) => CalendarMapper.modelToEntity(CalendarModel(timers: fakeTimers)));
            final data = isLoading ? fake : state.data;
            final outerRadius = Radius.circular(15);
            final innerRadius = Radius.circular(5);

            return Skeletonizer(
              enabled: isLoading,
              enableSwitchAnimation: true,
              child: Padding(
                padding: .only(top: 30, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Skeleton.keep(
                      keep: true,
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                        child: Row(
                          textDirection: isMobile ? .rtl : .ltr,
                          spacing: 10,
                          children: [
                            IconButton(onPressed: () => context.read<CalendarBloc>().add(GetCalendarWeekly()), icon: Icon(Icons.refresh)),
                            Expanded(
                              child: Text(
                                "Har kunlik chiqadigan animelar ro'yxati",
                                style: isMobile ? context.textTheme.headlineSmall : context.textTheme.headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 23),
                    SizedBox(
                      height: isMobile ? 300 : 350,
                      child: CustomScrollView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        slivers: [
                          const SliverToBoxAdapter(child: SizedBox(width: 5)),
                          ...data.map(
                            (e) => SliverPadding(
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              sliver: SliverCrossAxisGroup(
                                slivers: [
                                  SliverConstrainedCrossAxis(
                                    maxExtent: 31,
                                    sliver: PinnedHeaderSliver(child: weekTitle(context, innerRadius, outerRadius, e)),
                                  ),
                                  SliverConstrainedCrossAxis(maxExtent: 5, sliver: const SliverToBoxAdapter(child: SizedBox())),
                                  SliverCrossAxisExpanded(
                                    flex: 1,
                                    // maxExtent: timersHeight,
                                    sliver: SliverToBoxAdapter(child: timers(context, innerRadius, outerRadius, e)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container weekTitle(BuildContext context, Radius innerRadius, Radius outerRadius, CalendarEntity? e) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: context.appColors.primary,
        borderRadius: BorderRadius.only(bottomLeft: innerRadius, bottomRight: outerRadius, topLeft: outerRadius, topRight: outerRadius),
      ),
      child: Skeleton.ignore(
        ignore: true,
        child: Text(
          "${toBeginningOfSentenceCase(e?.date.formatDynamicWeeks())}${e?.timers != null ? " ${e?.timers.length}ta" : ""}",
          style: TextStyle(color: context.appColors.onPrimary),
        ),
      ),
    );
  }

  Container timers(BuildContext context, Radius innerRadius, Radius outerRadius, CalendarEntity? calendar) {
    final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
    final double width = isMobile ? 150 : 180;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: context.appColors.primaryContainer),
        borderRadius: BorderRadius.only(topLeft: innerRadius, bottomLeft: outerRadius, bottomRight: outerRadius, topRight: outerRadius),
      ),
      padding: EdgeInsets.all(5),
      child: (calendar != null && calendar.timers.isNotEmpty)
          ? Row(
              spacing: 10,
              children: calendar.timers.where((e) => e.anime.slug != "bir-soatli-qizcha-5").toList().asMap().entries.map((e) {
                final timer = e.value;
                final episode = timer.episode.episodeNumber;
                final hasEpisode = episode != 0;
                return Badge(
                  label: Skeleton.ignore(child: Text("${timer.time.formatTime()}${hasEpisode ? "\t/\t$episode-qism" : ""} ")),
                  alignment: AlignmentGeometry.topLeft,
                  offset: Offset(6, 12),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  textStyle: TextStyle(fontSize: 16),
                  child: FocusTraversalOrder(
                    order: NumericFocusOrder(calendar.date.year * 100 + calendar.date.month * 10 + calendar.date.day + (e.key * 0.1)),
                    child: AnimeCard(anime: timer.anime, expand: false),
                  ),
                );
              }).toList(),
            )
          : SizedBox(
              width: width,
              child: AspectRatio(
                aspectRatio: 9 / 15,
                child: Center(child: Text("Hozircha bu kunda hech qanday anime rejalashtirilmagan", textAlign: TextAlign.center)),
              ),
            ),
    );
  }
}
