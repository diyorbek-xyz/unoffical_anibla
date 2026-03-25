import 'package:application/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_event.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_state.dart';
import 'package:application/features/calendar/presentation/widget/timer.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CalendarBloc>()..add(GetCalendar(DateTime.now())),
      child: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          if (state is CalendarSuccess) {
            return Column(children: state.data.timers.map((e) => TimerWidget(timer: e)).toList());
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
}
