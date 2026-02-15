import 'package:application/data/models/param_models/anime_params.dart';

abstract class RemoteAnimeEvent {
  const RemoteAnimeEvent();
}

class GetAnimes extends RemoteAnimeEvent {
  final GetAnimesParams params;
  const GetAnimes(this.params);
}

class RefreshAnimes extends RemoteAnimeEvent {
  final GetAnimesParams params;
  const RefreshAnimes(this.params);
}
