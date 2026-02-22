import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/entities/filter/category_entity.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryEntity>>> getCategoriesList();
}
