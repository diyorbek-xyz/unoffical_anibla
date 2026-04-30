import 'package:intl/intl.dart';

extension StringExt on String {
  int parseInt() => int.parse(this);
  int? tryParseInt() => int.tryParse(this);
  double parseDouble() => double.parse(this);
  double? tryParseDouble() => double.tryParse(this);
  String extractYTId() {
    return split("/").last.split("=").last;
  }
}

String lorem([int? len]) {
  final text =
      "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl quack. Quick wafting zephyrs vex bold Jim. Quick zephyrs blow, vexing daft Jim. Sex-charged fop blew my junk TV quiz. How quickly daft jumping zebras vex. Two driven jocks help fax my big quiz. Quick, Baz, get my woven flax jodhpurs! \"Now fax quiz Jack! \" my brave";
  if (len != null) return text.substring(0, len);
  return text;
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

  List<DateTime> getWeekDays() => List.generate(7, (index) => add(Duration(days: index)));
  String formatRemaining() {
    final diff = DateTime.now().difference(this);
    if (diff.inDays >= 365) {
      return "${diff.inDays / 365} yil oldin";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} kun oldin";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} soat oldin";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} daqiqa oldin";
    }
    if (diff.inSeconds > 0) {
      return "${diff.inSeconds} soniya oldin";
    }
    return "";
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

extension Extension<T> on List<T> {
  List<T> notLast() {
    final list = [...this];
    list.removeLast();
    return list;
  }
}
