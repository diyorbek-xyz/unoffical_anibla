import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

int parseString(String str) {
  try {
    int integer = int.parse(str);
    return integer;
  } catch (err) {
    return 0;
  }
}

String addBaseUrl(String? path) {
  if (path == null) return "";
  if (path.contains('profile_not_found.png')) return "assets/images/avatar.png";
  if (path.startsWith(dotenv.env['NEW_BASE_URL']!)) {
    return path;
  } else if (path.startsWith("/")) {
    return dotenv.env['NEW_BASE_URL']! + path;
  } else {
    return "${dotenv.env['NEW_BASE_URL']}/$path";
  }
}

final compact = NumberFormat.compact(locale: "uz");

String formatDate(DateTime date) {
  String day = date.day.toString();
  String month = date.month.toString();
  String year = date.year.toString();

  return '$day-$month-$year';
}

class FormatDate {
  final String compact;
  final String title;
  final String weekday;
  final String dynamicWeekday;
  final String time;
  const FormatDate({
    required this.compact,
    required this.dynamicWeekday,
    required this.weekday,
    required this.title,
    required this.time,
  });

  factory FormatDate.format(DateTime date) {
    final compact = DateFormat("d-MM-y", 'uz-UZ').format(date);
    final title = DateFormat(DateFormat.MONTH_DAY, 'uz-UZ').format(date);
    final weekday = DateFormat("EEEE", "uz-UZ").format(date);
    final today = DateTime.now();
    final tomorrow = today.add(Duration(days: 1));
    final yesterday = today.subtract(Duration(days: 1));
    String dynamicWeekday() {
      if ((today.day - date.day).abs() > 6 || (date.month - today.month).abs() != 0) {
        return title;
      }
      if (date.weekday == yesterday.weekday &&
          date.day == yesterday.day &&
          date.month == yesterday.month &&
          date.year == yesterday.year) {
        return "kecha";
      }
      if (date.weekday == tomorrow.weekday &&
          date.day == tomorrow.day &&
          date.month == tomorrow.month &&
          date.year == tomorrow.year) {
        return "ertaga";
      }
      if (date.weekday == today.weekday &&
          date.day == today.day &&
          date.month == today.month &&
          date.year == today.year) {
        return "bugun";
      }
      return weekday;
    }

    return FormatDate(
      title: toBeginningOfSentenceCase(title),
      compact: compact,
      dynamicWeekday: toBeginningOfSentenceCase(dynamicWeekday()),
      weekday: toBeginningOfSentenceCase(weekday),
      time: DateFormat(DateFormat.HOUR24_MINUTE, 'uz-UZ').format(date),
    );
  }
}

extension StringExt on String {
  int parseInt() => int.parse(this);
  int? tryParseInt() => int.tryParse(this);
  double parseDouble() => double.parse(this);
  double? tryParseDouble() => double.tryParse(this);
}

extension DateFormatting on DateTime {
  String formatCompact({String divider = "-"}) =>
      DateFormat("d${divider}MM${divider}y", 'uz-UZ').format(this);
  String formatDay() =>
      toBeginningOfSentenceCase(DateFormat(DateFormat.MONTH_DAY, 'uz-UZ').format(this));
  String formatFull() =>
      toBeginningOfSentenceCase(DateFormat("d-MMMM hh:mm", 'uz-UZ').format(this));
  String formatWeekday() => toBeginningOfSentenceCase(DateFormat("EEEE", "uz-UZ").format(this));
  String formatTime() => DateFormat(DateFormat.HOUR24_MINUTE, 'uz-UZ').format(this);
  String formatDynamicWeeks() {
    final today = DateTime.now();
    final tomorrow = today.add(Duration(days: 1));
    final yesterday = today.subtract(Duration(days: 1));
    if ((today.day - day).abs() > 6 || (month - today.month).abs() != 0) {
      return formatDay();
    }
    if (day == yesterday.day && month == yesterday.month && year == yesterday.year) {
      return "kecha";
    }
    if (day == tomorrow.day && month == tomorrow.month && year == tomorrow.year) {
      return "ertaga";
    }
    if (day == today.day && month == today.month && year == today.year) {
      return "bugun";
    }
    return formatWeekday();
  }
}

extension DurationFormatting on Duration {
  String toCountdown() {
    final full = toString().split('.').first;
    final hours = full.split(":").first.tryParseInt() ?? 0;
    final days = (hours / 24).toInt();
    final hour = hours % 24;
    final other = full.split(":").skip(1).join(":");
    final misc = hour > 0
        ? days > 0
              ? "$days-kun $hour:"
              : "$hour:"
        : "";
    final formatted = "$misc$other";
    return formatted;
  }
}
