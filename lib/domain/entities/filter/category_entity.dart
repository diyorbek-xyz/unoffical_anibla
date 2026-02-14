import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final TranslatedEntity? name;
  final String? slug;
  const CategoryEntity({this.id, this.name, this.slug});

  @override
  List<Object?> get props => [id, name, slug];
}
