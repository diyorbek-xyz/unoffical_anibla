import 'dart:async';

import 'package:application/core/utils/utils.dart';
import 'package:application/features/calendar/domain/entities/timer_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final TimerEntity timer;
  const TimerWidget({super.key, required this.timer});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  late int _remaining;
  void startCountDown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_remaining <= 0) {
        timer.cancel();
      } else {
        setState(() => _remaining--);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() => _remaining = widget.timer.time.difference(DateTime.now()).inSeconds);
    startCountDown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Ink.image(
            image: CachedNetworkImageProvider(addBaseUrl(widget.timer.anime['thumbnail'])),
            fit: BoxFit.cover,
            child: Text(widget.timer.anime['uz']['title']),
          ),
        ],
      ),
    );
  }
}
