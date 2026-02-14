import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/domain/entities/other/country_entity.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'country_model.g.dart';

@HiveType(typeId: 50)
class CountryModel extends CountryEntity {
  @HiveField(0)
  @override
  String? get id => super.id;
  @HiveField(1)
  @override
  TranslatedEntity? get name => super.name;
  @HiveField(2)
  @override
  String? get flag => super.flag;
  const CountryModel({super.flag, super.id, super.name});

  factory CountryModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return CountryModel(flag: json['flag'], id: json['_id'], name: TranslatedModel.fromJson(json['name']));
    }
    if (json is String) {
      return CountryModel(id: json);
    }

    throw Exception("Invalid json format: $json");
  }
}
