import 'package:application/data/models/animes/anime_model.dart';
import 'package:application/data/models/filter/filter_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

late Box<AnimeModel> animesBox;
late Box<CalendarModel> calendarBox;
late Box<CategoryModel> categoriesBox;
late Box<GenreModel> genresBox;
late Box<CarouselItemModel> carouselBox;
late Box<AnimeModel> searchBox;