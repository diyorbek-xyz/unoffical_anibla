import 'package:intl/intl.dart';

enum DataType {
  anibla,
  mano;

  bool get isAnibla => this == .anibla;
  bool get isMano => this == .mano;

  @override
  toString() => toBeginningOfSentenceCase(name);
}
