import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'big_response.g.dart';
part 'big_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class BigResponse<T> with _$BigResponse<T> {
  const factory BigResponse({
    @Default([]) @JsonKey(name: "data") List<T> datas,
    @Default(false) bool success,
    @Default("") String message,
    @Default(Pagination()) Pagination pagination,
    @Default("") dynamic error,
  }) = _BigResponse<T>;

  factory BigResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BigResponseFromJson<T>(json, fromJsonT);
}
