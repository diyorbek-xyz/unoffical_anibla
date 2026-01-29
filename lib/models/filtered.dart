import 'package:application/models/anime.dart';
import 'package:application/models/category.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'filtered.g.dart';

@HiveType(typeId: 8)
class CategoryFiltered {
  @HiveField(0)
  final Category category;
  @HiveField(1)
  final List<Anime> animes;
  const CategoryFiltered({required this.animes, required this.category});

  factory CategoryFiltered.fromJsons(dynamic category, List<dynamic> animes) {
    List<Anime> animesList = animes.map((anime) => Anime.fromJson(anime)).toList();
    return CategoryFiltered(animes: animesList, category: Category.fromJson(category));
  }
}
