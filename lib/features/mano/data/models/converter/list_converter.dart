import 'package:freezed_annotation/freezed_annotation.dart';

class ListConverter implements JsonConverter<List<String>, String> {
  final String symbol;
  const ListConverter(this.symbol);

  @override
  List<String> fromJson(String json) => json.split(symbol);

  @override
  String toJson(List<String> object) => object.join(symbol);
}

class CommaConverter extends ListConverter {
  const CommaConverter() : super(",");
}

class PercentConverter extends ListConverter {
  const PercentConverter() : super("%");
}