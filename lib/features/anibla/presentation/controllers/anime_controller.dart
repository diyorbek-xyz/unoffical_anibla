import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/anibla/data/models/main/season.dart';
import 'package:application/features/anibla/domain/repositories/anime_repository.dart';
import 'package:application/features/anibla/domain/repositories/episode_repository.dart';
import 'package:application/features/anibla/domain/repositories/season_repository.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AnimeController {
  final AnimeRepository _animeRepository;
  final SeasonRepository _seasonRepository;
  final EpisodeRepository _episodeRepository;
  AnimeController(this._animeRepository, this._seasonRepository, this._episodeRepository);

  final homeState = signal(BigSignalState<Anime>());

  Future<void> getHome(Pagination paginator) async {
    homeState.set(homeState.value.setLoading(true));
    final either = await _animeRepository.getHomeAnimes(paginator);
    final data = either.fold((l) => homeState.value.withError(l.message), (r) => homeState.value.withMore(r.pagination, r.datas));
    homeState.set(data);
  }

  Future<void> getHomeMore() async {
    final pagination = homeState.value.pagination;
    if (!pagination.hasMore) return;
    await getHome(Pagination(limit: pagination.limit, page: pagination.page + 1));
  }

  final mediaState = signal(SignalState<Anime>());
  final fakeMedia = Anime();

  Future<void> getMedia(AnimeType type, String slug) async {
    if (mediaState.value.isLoading) return;
    mediaState.set(mediaState.value.setLoading(true));

    final either = await _animeRepository.getSerie(type, slug);
    mediaState.set(either.fold((l) => mediaState.value.withError(l.message), mediaState.value.withValue));
  }

  final seasonsState = signal(SignalState<List<Season>>());
  final fakeSeasons = List.generate(2, (index) => Season());

  Future<void> getSeasons([String? animeSlug]) async {
    if (seasonsState.value.isLoading) return;
    seasonsState.set(seasonsState.value.setLoading(true));
    final slug = mediaState.value.value?.slug ?? animeSlug;
    if (slug == null) {
      seasonsState.set(seasonsState.value.withError("Slug yo'q: $slug"));
      return;
    }
    final either = await _seasonRepository.getAllSeasons(slug);
    seasonsState.set(either.fold((l) => seasonsState.value.withError(l.message), seasonsState.value.withValue));
  }

  final episodesState = signal(SignalState<List<Episode>>());
  final fakeEpisodes = List.generate(6, (index) => Episode());

  Future<void> getEpisodes([String? animeSlug, String? seasonSlug]) async {
    if (episodesState.value.isLoading) return;
    episodesState.set(episodesState.value.setLoading(true));

    final aSlug = mediaState.value.value?.slug ?? animeSlug;
    final sSlug = seasonsState.value.value?.first.slug ?? seasonSlug;

    if (aSlug == null || sSlug == null) {
      seasonsState.set(seasonsState.value.withError("Slug yo'q: $aSlug $sSlug"));
      return;
    }
    final either = await _episodeRepository.getEpisodes(aSlug, sSlug);
    episodesState.set(either.fold((l) => episodesState.value.withError(l.message), episodesState.value.withValue));
  }

  Future<void> getFullAnime(AnimeType type, String slug) async {
    resetMedia();
    await getMedia(type, slug);
    await getSeasons();
    await getEpisodes();
  }

  void resetMedia() {
    mediaState.set(SignalState<Anime>());
    seasonsState.set(SignalState<List<Season>>());
    episodesState.set(SignalState<List<Episode>>());
  }

  void disposeMedia() {
    mediaState.dispose();
    seasonsState.dispose();
    episodesState.dispose();
  }
}
