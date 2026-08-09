import 'dart:io';

import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/source/local/saved_ids_local.dart';
import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SavedController {
  final AnimeRepository _animeRepository;
  final SavedLocal _savedLocal;
  SavedController(this._animeRepository, this._savedLocal);

  late final savedMediaSignal = futureSignal(() async {
    final either = await _animeRepository.getSaveMedias();
    return either.getData();
  });

  List<String> get savedMedias => _savedLocal.getSavedIds();
  bool isSaved(String id) => _savedLocal.isThisSaved(id);

  void saveMedia(String id, AnimeType type, [bool? exist]) async {
    try {
      final saveds = savedMedias;
      final isSaved = exist ?? saveds.contains(id);
      late Either<Failure, bool> either;
      if (isSaved) {
        either = await _animeRepository.unsaveMedia(id, type);
      } else {
        either = await _animeRepository.saveMedia(id, type);
      }
      final success = either.getData();
      if (success) {
        if (isSaved) {
          await _savedLocal.unsaveMedia(id);
        } else {
          await _savedLocal.saveMedia(id);
        }
        await savedMediaSignal.refresh();
      }
    } on Failure catch (e) {
      if (e is ServerFailure && e.status == HttpStatus.conflict) return saveMedia(id, type, true);
      // TODO -> Handle errors
    }
  }

  Future<void> refreshSaveds() => savedMediaSignal.refresh();
}
