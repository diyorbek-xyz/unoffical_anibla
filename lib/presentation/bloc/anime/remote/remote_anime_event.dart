import 'package:application/data/models/param_models/anime_params.dart';

sealed class RemoteAnimesListEvent {
  const RemoteAnimesListEvent();
}

final class GetAnimesList extends RemoteAnimesListEvent {
  final GetAnimesParams params;
  const GetAnimesList(this.params);
}

final class RefreshAnimesList extends RemoteAnimesListEvent {
  final GetAnimesParams params;
  const RefreshAnimesList(this.params);
}

sealed class RemoteAnimeDetailsEvent {
  const RemoteAnimeDetailsEvent();
}

final class GetAnimeDetails extends RemoteAnimeDetailsEvent {
  final GetAnimeDetailsParams params;
  const GetAnimeDetails(this.params);
}
