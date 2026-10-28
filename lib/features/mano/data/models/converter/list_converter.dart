import 'package:freezed_annotation/freezed_annotation.dart';

class ListConverter implements JsonConverter<List<String>, String> {
  const ListConverter();

  @override
  List<String> fromJson(String json) => json.split("%");

  @override
  String toJson(List<String> object) => object.join("%");
}
