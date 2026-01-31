import 'package:application/data/models/anime.dart';
import 'package:application/data/models/filter.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

late Box<Anime> animesBox;
late Box<Anime> calendarBox;
late Box<Category> categoriesBox;
late Box<Genre> genresBox;
late Box<Anime> carouselBox;
