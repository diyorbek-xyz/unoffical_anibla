import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:application/domain/repositories/episode_repository.dart';

class GetVideoUsecase implements UseCase<DataState<VideoEntity>, String> {
  EpisodeRepository repository;
  GetVideoUsecase(this.repository);
  @override
  Future<DataState<VideoEntity>> call(String source) {
    return repository.getVideo(source);
  }
}
