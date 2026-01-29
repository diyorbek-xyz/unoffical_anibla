import 'package:application/models/anime.dart';
import 'package:application/models/category.dart';
import 'package:application/models/filtered.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

late Box<Anime> animesBox;
late Box<Category> categoriesBox;
late Box<Genre> genresBox;
late Box<Anime> carouselBox;
late Box<CategoryFiltered> categoryFilteredBox;
