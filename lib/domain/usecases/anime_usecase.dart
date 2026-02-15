import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/data/models/param_models/anime_params.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/repositories/anime_repository.dart';


class GetAnimesListUseCase implements UseCase<DataState<List<AnimeEntity>>, GetAnimesParams> {
  final AnimeRepository repository;
  GetAnimesListUseCase(this.repository);

  @override
  Future<DataState<List<AnimeEntity>>> call(GetAnimesParams params) async {
    return repository.getAnimes(limit: params.limit, page: params.page);
  }
}

class GetAnimeDetailsUseCase implements UseCase<DataState<AnimeEntity>, String> {
  final AnimeRepository repository;
  GetAnimeDetailsUseCase(this.repository);
  @override
  Future<DataState<AnimeEntity>> call(String animeSlug) {
    return repository.getAnime(animeSlug: animeSlug);
  }
}
