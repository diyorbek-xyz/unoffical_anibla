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
          return CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}

Map<String, dynamic> sample = {
  "_id": "696b87486b38bc666fb20000",
  "uz": {
    "title": "Friren: So'ngi manzilga kuzatuvchi 2",
    "description":
        "Bir vaqtlar qahramon hamrohlari Himmel, Xayter va Ayzen bilan birga Jinlar Qirolni mag'lub etgan elf sehrgar Friren dunyo bo'ylab kezishda davom etmoqda. Odamlarning his-tuyg'ularini yaxshiroq tushunish va vafot etgan do'stlarining so'nggi tilaklarini bajarishga intilib, Friren shogirdi Fern va jangchi Stark bilan sayohatga chiqadi. Uning sayohati shimolga olib boradi, u yerda muzli xavf nafaqat yomon ob-havoda, balki mahalliy aholining niyatlarida ham yashiringan.\nYer yuzidagi jannat deb hisoblangan yo'lda Friren va uning hamrohlari yangi do'stlar bilan uchrashadilar va o'tib bo'lmaydigan o'rmon tubida yashiringan kuchli yovuzlikka duch kelishadi.",
    "_id": "696b88a0cb300d9b0ed88164",
  },
  "ru": {
    "title": "Провожающая в последний путь Фрирен 2",
    "description":
        "Эльфийская волшебница Фрирен, в прошлом одолевшая Короля демонов вместе со своими героическими товарищами Химмелем, Хайтером и Айзеном, продолжает странствовать по миру. Пытаясь лучше понять чувства людей и исполнить последние желания ушедших друзей, Фрирен отправляется в путешествие со своей ученицей Ферн и воином Штарком. Её путь лежит на север, где леденящая опасность скрывается не только в ненастной погоде, но и в намерениях местных обитателей.\nПо дороге к месту, которое, по преданию, является раем на земле, Фрирен и компании предстоит как встретиться с новыми друзьями, так и столкнуться лицом к лицу с могущественным злом, затаившимся в чаще непролазного леса.",
    "_id": "696b88a0cb300d9b0ed88165",
  },
  "slug": "friren-so-ngi-manzilga-kuzatuvchi-2",
  "genres": [],
  "categories": [],
  "thumbnail": "uploads/1768653973447-806721670.jpg",
  "images": ["/uploads/1768653983963-51707128.jpg"],
};
