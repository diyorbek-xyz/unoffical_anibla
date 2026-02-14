import 'package:application/domain/usecases/anime_usecase.dart';

abstract class RemoteAnimeEvent {
  const RemoteAnimeEvent();
}

class GetAnimes extends RemoteAnimeEvent {
  final GetAnimesParams params;
  const GetAnimes(this.params);
}
