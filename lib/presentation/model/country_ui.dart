import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/domain/entities/other/country_entity.dart';
import 'package:application/presentation/model/translated_ui.dart';

class CountryUiModel {
  final String id;
  final TranslatedUiModel name;
  final String flag;
  const CountryUiModel({required this.flag, required this.id, required this.name});
  factory CountryUiModel.fromEntity(CountryEntity entity) {
    return CountryUiModel(
      flag: entity.flag ?? "flag",
      id: entity.id ?? 'id',
      name: TranslatedUiModel.fromEntity(entity.name ?? TranslatedEntity()),
    );
  }
}
