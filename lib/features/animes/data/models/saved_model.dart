import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_model.g.dart';
part 'saved_model.freezed.dart';

@freezed
abstract class SavedModel with _$SavedModel {
  factory SavedModel({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "media") AnimeModel? anime,
    @JsonKey(name: "last_visited") DateTime? lastVisitedAt,
  }) = _SavedModel;

  factory SavedModel.fromJson(Map<String, dynamic> json) => _$SavedModelFromJson(json);
}
