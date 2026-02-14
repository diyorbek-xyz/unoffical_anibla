import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/domain/entities/anime_entity.dart';
import 'package:application/domain/repositories/anime_repository.dart';

class GetAnimesParams {
  final int limit;
  final int page;
  const GetAnimesParams({required this.limit, required this.page});
}

class GetAnimesUseCase implements UseCase<DataState<List<AnimeEntity>>, GetAnimesParams> {
  final AnimeRepository repository;
  GetAnimesUseCase(this.repository);

  @override
  Future<DataState<List<AnimeEntity>>> call(GetAnimesParams params) async {
    return repository.getAnimes(limit: params.limit, page: params.page);
  }
}