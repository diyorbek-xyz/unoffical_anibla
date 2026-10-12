import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/player/presentation/controller/player_controller.dart';
import 'package:application/features/player/presentation/widgets/player_scope.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signals_flutter/signals_flutter.dart';

void prints(List<Object?> values) => values.forEach(print);

String lorem([int? len]) {
  final text =
      "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl quack. Quick wafting zephyrs vex bold Jim. Quick zephyrs blow, vexing daft Jim. Sex-charged fop blew my junk TV quiz. How quickly daft jumping zebras vex. Two driven jocks help fax my big quiz. Quick, Baz, get my woven flax jodhpurs! \"Now fax quiz Jack! \" my brave";
  if (len != null) return text.substring(0, len);
  return text;
}

extension StringExt on String {
  int parseInt() => int.parse(this);
  int? tryParseInt() => int.tryParse(this);
  double parseDouble() => double.parse(this);
  double? tryParseDouble() => double.tryParse(this);
  String extractYTId() => split("/").last.split("=").last;
  String? toNullable() => trim().isEmpty ? null : this;
}

extension IntExt on int {
  int? toNullable(int minInt) => this < minInt ? null : this;
}

extension DateFormatting on DateTime {
  String formatCompact({String divider = "-"}) => DateFormat("d${divider}MM${divider}y", 'uz-UZ').format(this);
  String formatDay() => toBeginningOfSentenceCase(DateFormat(DateFormat.MONTH_DAY, 'uz-UZ').format(this));
  String formatFull() => toBeginningOfSentenceCase(DateFormat("hh:mm d-MMMM y", 'uz-UZ').format(this));
  String formatWeekday() => toBeginningOfSentenceCase(DateFormat("EEEE", "uz-UZ").format(this));
  String formatTime() => DateFormat(DateFormat.HOUR24_MINUTE, 'uz-UZ').format(this);
  List<DateTime> getWeekDays() => List.generate(7, (index) => add(Duration(days: index)));

  String formatDynamicWeeks() {
    final today = DateTime.now();
    final tomorrow = today.add(Duration(days: 1));
    final yesterday = today.subtract(Duration(days: 1));
    if ((today.day - day).abs() > 6 || (month - today.month).abs() != 0) return formatDay();
    if (day == yesterday.day && month == yesterday.month && year == yesterday.year) return "kecha";
    if (day == tomorrow.day && month == tomorrow.month && year == tomorrow.year) return "ertaga";
    if (day == today.day && month == today.month && year == today.year) return "bugun";
    return formatWeekday();
  }

  String formatRemaining() {
    final diff = DateTime.now().difference(this);
    if (diff.inDays >= 365) return "${diff.inDays / 365} yil oldin";
    if (diff.inDays > 31) return "${(diff.inDays / 30).toInt()} oy oldin";
    if (diff.inDays > 0) return "${diff.inDays} kun oldin";
    if (diff.inHours > 0) return "${diff.inHours} soat oldin";
    if (diff.inMinutes > 0) return "${diff.inMinutes} daqiqa oldin";
    if (diff.inSeconds > 0) return "${diff.inSeconds} soniya oldin";
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

extension ListExtension<T> on List<T> {
  List<T> notLast() {
    final list = [...this];
    list.removeLast();
    return list;
  }

  List<T> withValue(List<T> value) => this + value;
}

extension MapListExtension<T> on Map<String, List<T>> {
  Map<String, List<T>> withValues(String key, List<T> values) => {...this, key: (this[key] ?? []) + values};
}

extension MapExtension<T> on Map<String, T> {
  Map<String, T> withValue(String key, T value) => {...this, key: value};
}

extension SignalForZ<T> on Either<Failure, T> {
  T getData() => fold((l) => throw l, (r) => r);
}

extension SignalExt<T> on FlutterSignal<SignalState<T>> {
  void setLoading(bool val) => set(value.setLoading(val));
  void setValue(T val) => set(value.withValue(val));
  void setError(String err) => set(value.withError(err));
  T? get data => value.value;
  String? get error => value.error;
  bool get isLoading => value.isLoading;
  bool get hasError => value.hasError;
  bool get hasValue => value.hasValue;
}

extension BigSignalExt<T> on FlutterSignal<BigSignalState<T>> {
  void setLoading(bool val) => set(value.setLoading(val));
  void setValues(List<T> values) => set(value.withValues(values));
  void setMore(Pagination pagination, List<T> values) => set(value.withMore(pagination, values));
  void setPagination(Pagination pagination) => set(value.withPagination(pagination));
  void setError(String err) => set(value.withError(err));
  List<T>? get data => value.value;
  String? get error => value.error;
  bool get isLoading => value.isLoading;
  bool get hasError => value.hasError;
  bool get hasValue => value.hasValue;
}

extension NamedSignalExt<T> on FlutterSignal<NamedSignalState<T>> {
  void setLoading(String key, bool val) => set(value.setLoading(key, val));
  void setEntry(String key, Pagination paginate, List<T> values) => set(value.withEntry(key, paginate, values));
  void setPagination(String key, Pagination pagination) => set(value.withPagination(key, pagination));
  void setError(String key, String err) => set(value.withError(key, err));
  BigSignalState<T>? getEntry(String key) => value.getEntry(key);
  String? getError(String key) => value.getError(key);
  Pagination getPagination(String key) => value.getPagination(key);
  bool getIsLoading(String key) => value.getIsLoading(key);
  bool getHasError(String key) => value.getHasError(key);
  bool getHasValue(String key) => value.getHasValue(key);
}

extension ContextExt on BuildContext {
  PlayerController get player => PlayerScope.of(this);
  Size get screen => MediaQuery.of(this).size;
  bool get isMobile => screen.width <= MOBILE_WIDTH;
  T controller<T extends Object>() => sl<T>();
}

extension EpisodeExt on List<Episode> {
  Episode? getEpisode(int number) => where((element) => element.episodeNumber == number).singleOrNull;
}
