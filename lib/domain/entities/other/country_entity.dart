import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String? id;
  final TranslatedEntity? name;
  final String? flag;
  const CountryEntity({this.flag, this.id, this.name});

  @override
  List<Object?> get props => [id, name, flag];
}
