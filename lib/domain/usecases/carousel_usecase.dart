import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/domain/entities/other/carousel_entity.dart';
import 'package:application/domain/repositories/carousel_repository.dart';

class GetCarouselItemsUsecase implements UseCase<DataState<List<CarouselItemEntity>>, void> {
  final CarouselRepository _repository;
  const GetCarouselItemsUsecase(this._repository);

  @override
  Future<DataState<List<CarouselItemEntity>>> call(void params) {
    return _repository.getCarouselItemList();
  }
}
