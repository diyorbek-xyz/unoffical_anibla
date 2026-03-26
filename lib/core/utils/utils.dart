import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

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
      toBeginningOfSentenceCase(DateFormat("hh:mm d-MMMM y", 'uz-UZ').format(this));
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
