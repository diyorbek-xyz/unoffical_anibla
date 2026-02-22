import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/data/models/param_models/search_params.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/repositories/anime_repository.dart';

class SearchAnimesUsecase implements UseCase<DataState<List<AnimeEntity>>, SearchParams> {
  final AnimeRepository _animeRepository;
  const SearchAnimesUsecase(this._animeRepository);

  @override
  Future<DataState<List<AnimeEntity>>> call(SearchParams params) async {
    return _animeRepository.searchAnimes(params);
  }
}
