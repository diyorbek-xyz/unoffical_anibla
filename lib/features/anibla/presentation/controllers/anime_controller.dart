import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/anibla/data/models/main/season.dart';
import 'package:application/features/anibla/domain/repositories/anime_repository.dart';
import 'package:application/features/anibla/domain/repositories/episode_repository.dart';
import 'package:application/features/anibla/domain/repositories/season_repository.dart';
import 'package:application/features/anibla/presentation/controllers/comment_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AnimeController {
  final AnimeRepository _animeRepository;
  final SeasonRepository _seasonRepository;
  final EpisodeRepository _episodeRepository;
  AnimeController(this._animeRepository, this._seasonRepository, this._episodeRepository);

  late final animeState = signal(SignalState<Anime>());
  late final seasonsState = signal(SignalState<List<Season>>());
  late final episodesState = signal(SignalState<List<Episode>>());

  Future<void> getAnime([MediaType? mediaType, String? animeSlug]) async {
    if (animeState.isLoading) return;

    if (mediaType != null) _mediaType = mediaType;
    if (animeSlug != null) _animeSlug = animeSlug;

    final animeType = mediaType ?? _mediaType;
    final animeKey = animeSlug ?? _animeSlug;

    if (animeType == null || animeKey == null) return animeState.setError("Bad request: $animeType/$animeKey");

    animeState.setLoading(true);

    final either = await _animeRepository.getSerie(animeType, animeKey);

    either.fold((l) => animeState.setError(l.message), animeState.setValue);
  }

  Future<void> getSeasons([String? animeSlug]) async {
    if (seasonsState.isLoading) return;
    final animeKey = animeSlug ?? _animeSlug;

    if (animeKey == null) return seasonsState.setError("Slug yo'q: $animeKey");

    seasonsState.setLoading(true);

    final either = await _seasonRepository.getAllSeasons(animeKey);

    either.fold((l) => seasonsState.setError(l.message), (v) {
      if (v.isEmpty) return;
      _seasonSlug = v.first.slug;
      seasonsState.setValue(v);
    });
  }

  Future<void> getEpisodes([String? animeSlug, String? seasonSlug]) async {
    if (episodesState.isLoading) return;

    final animeKey = animeSlug ?? _animeSlug;
    final seasonKey = seasonSlug ?? _seasonSlug;

    if (animeKey == null || seasonKey == null) return seasonsState.setError("Slug yo'q: $animeKey $seasonKey");

    episodesState.setLoading(true);
    final either = await _episodeRepository.getEpisodes(animeKey, seasonKey);
    either.fold((l) => episodesState.setError(l.message), episodesState.setValue);
  }

  Future<void> getFullAnime(MediaType type, String slug, [String? seasonSlug]) async {
    resetMedia();
    await getAnime(type, slug);
    await getSeasons(slug);
    await getEpisodes(slug, seasonSlug);
    await _commentController.getAnimeComments();
  }

  //# refreshes
  Future<void> refreshFullAnime() async {
    if (_mediaType == null || _animeSlug == null) return;
    await getFullAnime(_mediaType!, _animeSlug!, _seasonSlug);
  }

  //# cleanups
  void resetMedia() {
    animeState.set(SignalState<Anime>());
    seasonsState.set(SignalState<List<Season>>());
    episodesState.set(SignalState<List<Episode>>());
    _commentController.resetAll();
  }

  void disposeMedia() {
    animeState.dispose();
    seasonsState.dispose();
    episodesState.dispose();
  }

  //# caches
  String? _animeSlug;
  MediaType? _mediaType;
  String? _seasonSlug;

  //# statics
  final fakeAnime = Anime(ru: {"description": lorem(), "title": lorem(10)}, uz: {"description": lorem(), "title": lorem(10)});
  final fakeSeasons = List.generate(2, (index) => Season());
  final fakeEpisodes = List.generate(6, (index) => Episode());
  late final _commentController = sl<CommentController>();
}
