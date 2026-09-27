import 'package:application/features/anibla/data/models/data/genre.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genres_response.g.dart';
part 'genres_response.freezed.dart';

@freezed
abstract class GenresResponse with _$GenresResponse {
  const factory GenresResponse({@Default([]) List<Genre> genres, @Default(Pagination()) Pagination pagination}) = _GenresResponse;
  factory GenresResponse.fromJson(Map<String, dynamic> json) => _$GenresResponseFromJson(json);
}
