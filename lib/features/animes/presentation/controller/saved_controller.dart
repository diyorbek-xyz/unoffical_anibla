import 'dart:io';

import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/source/local/saved_ids_local.dart';
import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/features/player/data/source/local/downloads.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LocalAnimesController {
  final AnimeRepository _animeRepository;
  final SavedLocal _savedLocal;
  final DownloadsLocal _downloadsLocal;
  LocalAnimesController(this._animeRepository, this._savedLocal, this._downloadsLocal);

  late final savedMediaSignal = futureSignal(() async {
    final either = await _animeRepository.getSaveMedias();
    return either.getData();
  });

  List<String> get savedMedias => _savedLocal.getSavedIds();

  bool isThisSaved(String id) => _savedLocal.isThisSaved(id);

  void saveMedia(String id, AnimeType type, [bool? exist]) async {
    try {
      final isSaved = exist ?? isThisSaved(id);
      late Either<Failure, bool> either;
      if (isSaved) {
        either = await _animeRepository.unsaveMedia(id, type);
      } else {
        either = await _animeRepository.saveMedia(id, type);
      }
      final success = either.getData();
      if (success) await savedMediaSignal.refresh();
    } on Failure catch (e) {
      if (e is ServerFailure && e.status == HttpStatus.conflict) return saveMedia(id, type, true);
      // Handle errors
    }
  }

  Future<void> refreshSaveds() => savedMediaSignal.refresh();

  late final downloadedMediaSignal = (_downloadsLocal.getAllDownloads()?.values.toList() ?? []).toSignal();
}
