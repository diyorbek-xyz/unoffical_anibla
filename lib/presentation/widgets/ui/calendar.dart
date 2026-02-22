import 'package:application/core/constants/theme.dart';
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

class _WidgetCalendarState extends State<WidgetCalendar> with SingleTickerProviderStateMixin {
  static const int _dateRange = 7;
  static const int _maxPreviewItems = 2;

  late final List<DateTime> dates;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    dates = List.generate(_dateRange, (index) => DateTime.now().add(Duration(days: index)));
    _tabController = TabController(length: dates.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    dividerHeight: 1,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.white30,
                    tabs: dates.map((date) => Tab(text: FormatDate.format(date).dynamicWeekday)).toList(),
                  ),
                ),
                IconButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(const Size(50, 50)),
                    shape: WidgetStatePropertyAll(BeveledRectangleBorder()),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<RemoteCalendarBloc, RemoteCalendarState>(
              builder: (context, state) {
                if (state is RemoteCalendarFailed) {
                  return _buildErrorState(context, state);
                }
                if (state is RemoteCalendarDone || state is RemoteCalendarLoading) {
                  return _buildCalendarView(state);
                }
                return const Center(child: Text("No data"));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, RemoteCalendarFailed state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text((state.exception?.error ?? "Nimadur xato ketti.").toString()),
          ElevatedButton.icon(
            onPressed: () => context.read<RemoteCalendarBloc>().add(GetCalendar(dates)),
            icon: const Icon(Icons.replay_outlined),
            label: const Text("Yanglilash"),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarView(RemoteCalendarState state) {
    final isLoading = state is RemoteCalendarLoading;
    return Skeletonizer(
      enabled: isLoading,
      effect: const PulseEffect(from: Colors.white, to: Colors.white10),
      enableSwitchAnimation: true,
      child: TabBarView(
        controller: _tabController,
        clipBehavior: Clip.hardEdge,
        children: state.list?.map((calendar) => _buildDayView(calendar, isLoading)).toList() ?? [],
      ),
    );
  }

  Widget _buildDayView(dynamic calendar, bool loading) {
    if (calendar.releases.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(5),
        child: Center(child: Text("Bu kunda hech qanday anime rejalashtirilmagan")),
      );
    }

    final List items = calendar.releases.take(_maxPreviewItems).toList();
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((anime) => CalendarCard(anime: anime, isLoading: loading)).toList(),
      ),
    );
  }
}

class CalendarCard extends StatefulWidget {
  final TimerUiModel anime;
  final bool isLoading;

  const CalendarCard({super.key, required this.anime, required this.isLoading});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  bool _isRealesed = false;

  @override
  void initState() {
    super.initState();
    setState(() => _isRealesed = widget.anime.releaseTime.isBefore(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 700;
    final fontSize = isDesktop ? 16.0 : 14.0;
    final titleFontSize = isDesktop ? 23.0 : 16.0;
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 165 : 140),
              child: AspectRatio(
                aspectRatio: 0.75,
                child: Skeleton.replace(
                  replace: widget.isLoading,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: CachedNetworkImageProvider(widget.anime.anime.thumbnail),
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(color: Colors.grey[300]),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          color: Colors.black87,
                          child: !_isRealesed
                              ? TimerCountdown(
                                  endTime: widget.anime.releaseTime,
                                  spacerWidth: 1,
                                  timeTextStyle: const TextStyle(fontSize: 20),
                                  enableDescriptions: false,
                                  onEnd: () => setState(() => _isRealesed = true),
                                )
                              : Text(
                                  "Tomosha qilishingiz mumkin!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      widget.anime.anime.title.uz,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold, color: primaryDark),
                    ),
                    _InfoText(label: "Chiqish sanasi:", value: FormatDate.format(widget.anime.releaseTime).title, fontSize: fontSize),
                    _InfoText(label: "Soat:", value: "${FormatDate.format(widget.anime.releaseTime).time} da", fontSize: fontSize),
                    _InfoText(label: "Qism:", value: "${widget.anime.episode.episodeNumber}-qism", fontSize: fontSize),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  final String label;
  final String value;
  final double fontSize;

  const _InfoText({required this.label, required this.value, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(fontSize: fontSize, color: Theme.of(context).textTheme.bodyMedium?.color),
        children: [
          TextSpan(
            text: "$label ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }
}
