import 'package:freezed_annotation/freezed_annotation.dart';

part 'mano_response.g.dart';
part 'mano_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class ManoResponse<T> with _$ManoResponse<T> {
  const factory ManoResponse({required T data, @Default(0) int limit, @Default(0) int offset, @Default(0) int total}) = _ManoResponse<T>;

  factory ManoResponse.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ManoResponseFromJson<T>(json, fromJsonT);
}
