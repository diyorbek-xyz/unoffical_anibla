import 'package:application/features/anibla/data/models/helper/localized.dart';
import 'package:application/features/anibla/data/models/main/season.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_view.freezed.dart';

@freezed
abstract class SeasonView with _$SeasonView {
  const factory SeasonView({
    @Default("") String id,
    @Default("") String slug,
    @Default(1) int offset,
    @Default(Localized()) Localized title,
  }) = _SeasonView;

  factory SeasonView.fromAnime(Season season) => .new(id: season.id, slug: season.slug, title: season.title);
}
