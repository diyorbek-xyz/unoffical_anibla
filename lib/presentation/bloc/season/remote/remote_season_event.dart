import 'package:application/data/models/param_models/season_params.dart';

sealed class RemoteSeasonEvent {
  const RemoteSeasonEvent();
}

final class GetSeasons extends RemoteSeasonEvent {
  final GetSeasonsParams params;
  const GetSeasons(this.params);
}

sealed class RemoteSeasonDetailsEvent {
  const RemoteSeasonDetailsEvent();
}

final class GetSeasonDetails extends RemoteSeasonDetailsEvent {
  final GetSeasonParams getSeasonParams;
  const GetSeasonDetails(this.getSeasonParams);
}
