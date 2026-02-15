import 'package:application/data/models/param_models/season_params.dart';

sealed class RemoteSeasonEvent {
  const RemoteSeasonEvent();
}

final class GetSeasons extends RemoteSeasonEvent {
  final GetSeasonsParams params;
  const GetSeasons(this.params);
}

final class GetSeasonBySlug extends RemoteSeasonEvent {
  final GetSeasonParams params;
  const GetSeasonBySlug(this.params);
}
