import 'package:application/data/sources/local/boxes.dart';
import 'package:application/data/models/animes/anime_model.dart';
import 'package:application/core/utils/utils.dart';

class AnimesLocal {
  List<AnimeModel>? getAll() {
    return animesBox.values.toList();
  }

  AnimeModel? get(String id) {
    return animesBox.get(id);
  }

  List<CarouselItemModel>? getCarousel() {
    return carouselBox.values.toList();
  }

  CalendarModel? getCalendar(DateTime date) {
    return calendarBox.get(FormatDate.format(date).compact);
  }

  List<AnimeModel>? getSearchHistory() {
    return searchBox.values.toList();
  }

  Future<void> save(AnimeModel anime) async {
    await animesBox.put(anime.id, anime);
  }

  Future<void> saveMany(List<AnimeModel> animes) async {
    for (var anime in animes) {
      await save(anime);
    }
  }

  Future<void> saveCarousel(List<CarouselItemModel> carousel) async {
    for (var item in carousel) {
      await carouselBox.put(item.id, item);
    }
  }

  Future<void> saveCalendar(CalendarModel calendar) async {
    await calendarBox.put(FormatDate.format(calendar.day).compact, calendar);
  }

  Future<void>? saveToSearchHistory(AnimeModel anime) async {
    await searchBox.put(anime.id, anime);
  }
}
