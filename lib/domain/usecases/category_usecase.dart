import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/domain/entities/filter/category_entity.dart';
import 'package:application/domain/repositories/category_repository.dart';

class GetCategoriesListUsecase implements UseCase<DataState<List<CategoryEntity>>, void> {
  final CategoryRepository repository;
  const GetCategoriesListUsecase(this.repository);
  @override
  Future<DataState<List<CategoryEntity>>> call(void params) async {
    return repository.getCategoriesList();
  }
}
