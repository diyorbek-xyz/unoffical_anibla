import 'package:flutter/material.dart';

class AnimeProvider extends ChangeNotifier {
  int episode;
  AnimeProvider({this.episode = 0});
  void changeEpisode({required int value}) async {
    episode = value;
    notifyListeners();
  }
}
