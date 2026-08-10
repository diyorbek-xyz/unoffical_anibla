import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/data/mapper/season_mapper.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/domain/entities/season_entity.dart';
import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/features/animes/domain/repository/episode_repository.dart';
import 'package:application/features/animes/domain/repository/season_repository.dart';
import 'package:application/features/common/data/models/helpers/paginator.dart';
import 'package:application/features/common/presentation/controller/signal_state.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AnimeController {
  final AnimeRepository _animeRepository;
  final SeasonRepository _seasonRepository;
  final EpisodeRepository _episodeRepository;
  AnimeController(this._animeRepository, this._seasonRepository, this._episodeRepository);

  final homeState = signal(BigSignalState<AnimeEntity>());

  void getHome(Paginator paginator) async {
    homeState.set(homeState.value.setLoading(true));
    final either = await _animeRepository.getHomeAnimes(paginator);
    final data = either.fold((l) => homeState.value.withError(l.message), (r) => homeState.value.withMore(r.pagination, r.datas));
    homeState.set(data);
  }

  final mediaState = signal(SignalState<AnimeEntity>());
  final fakeMedia = AnimeMapper.modelToEntity(null);

  Future<void> getMedia(AnimeType type, String slug) async {
    if (mediaState.value.isLoading) return;
    mediaState.set(mediaState.value.setLoading(true));

    final either = await _animeRepository.getSerie(type, slug);
    mediaState.set(either.fold((l) => mediaState.value.withError(l.message), mediaState.value.withValue));
  }

  final seasonsState = signal(SignalState<List<SeasonEntity>>());
  final fakeSeasons = List.generate(2, (index) => SeasonMapper.modelToEntity(null));

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

  final episodesState = signal(SignalState<List<EpisodeEntity>>());
  final fakeEpisodes = List.generate(6, (index) => EpisodeMapper.modelToEntity(null));

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

  void resetMedia(){
    mediaState.set(SignalState<AnimeEntity>());
    seasonsState.set(SignalState<List<SeasonEntity>>());
    episodesState.set(SignalState<List<EpisodeEntity>>());
  }
  void disposeMedia() {
    mediaState.dispose();
    seasonsState.dispose();
    episodesState.dispose();
  }
}
