import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/anibla/data/models/main/season.dart';
import 'package:application/features/anibla/domain/repositories/anime_repository.dart';
import 'package:application/features/anibla/domain/repositories/episode_repository.dart';
import 'package:application/features/anibla/domain/repositories/season_repository.dart';
import 'package:application/features/anibla/presentation/controllers/comment_controller.dart';
import 'package:application/features/ma-no/data/models/manga.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MediaController {
  final AnimeRepository _animeRepository;
  final SeasonRepository _seasonRepository;
  final EpisodeRepository _episodeRepository;
  MediaController(this._animeRepository, this._seasonRepository, this._episodeRepository);

  final homeState = signal(BigSignalState<Anime>());
  final animeState = signal(SignalState<Anime>());
  final seasonsState = signal(SignalState<List<Season>>());
  final episodesState = signal(SignalState<List<Episode>>());
  final mangaState = signal(SignalState<Manga>());

  final fakeAnime = Anime();
  final fakeSeasons = List.generate(2, (index) => Season());
  final fakeEpisodes = List.generate(6, (index) => Episode());
  final fakeManga = Manga();

  MediaType? _mediaType;
  String? _animeSlug;
  String? _seasonSlug;
  String? _mangaSlug;

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

  Future<void> getAnime([MediaType? mediatype, String? animeSlug]) async {
    if (animeState.isLoading) return;
    if (mediatype != null) _mediaType = mediatype;
    final type = mediatype ?? _mediaType;
    final slug = animeSlug ?? _animeSlug;
    if (type == null || slug == null) return animeState.setError("Slug yo'q: $slug");

    animeState.setLoading(true);
    final either = await _animeRepository.getSerie(type, slug);
    either.fold((l) => animeState.setError(l.message), (v) {
      _animeSlug = slug;
      _mediaType = type;
      return animeState.setValue(v);
    });
  }

  Future<void> getSeasons([String? animeSlug]) async {
    if (seasonsState.isLoading) return;
    final slug = animeSlug ?? _animeSlug;
    if (slug == null) return seasonsState.setError("Slug yo'q: $slug");
    seasonsState.setLoading(true);

    final either = await _seasonRepository.getAllSeasons(slug);
    either.fold((l) => seasonsState.setError(l.message), (v) {
      if (v.isEmpty) return;
      _seasonSlug = v.first.slug;
      seasonsState.setValue(v);
    });
  }

  Future<void> getEpisodes([String? animeSlug, String? seasonSlug]) async {
    if (episodesState.isLoading) return;

    final aSlug = animeSlug ?? _animeSlug;
    final sSlug = seasonSlug ?? _seasonSlug;
    if (aSlug == null || sSlug == null) return seasonsState.setError("Slug yo'q: $aSlug $sSlug");

    episodesState.setLoading(true);
    final either = await _episodeRepository.getEpisodes(aSlug, sSlug);
    either.fold((l) => episodesState.setError(l.message), episodesState.setValue);
  }

  Future<void> getFullAnime(MediaType type, String slug) async {
    final commentCon = sl<CommentController>();
    resetMedia();
    await getAnime(type, slug);
    await getSeasons(slug);
    await getEpisodes(slug);
    await commentCon.getAnimeComments();
  }

  Future<void> getManga([MediaType? mediaType, String? mangaSlug]) async {
    if (mangaState.isLoading) return;
    if (mediaType != null) _mediaType = mediaType;
    final slug = mangaSlug ?? _mangaSlug;
    final type = mediaType ?? _mediaType;
    prints([slug, type]);
    mangaState.setLoading(true);
    await Future.delayed(Duration(seconds: 2));
    mangaState.setValue(Manga.fromJson(manga));
  }

  Future<void> getMedia(MediaType type, String key) async {
    if (type.isAnime) await getFullAnime(type, key);
    if (type.isBook) await getManga(type, key);
  }

  bool isSame() => animeState.data?.slug == _animeSlug && animeState.data?.id != null && _animeSlug != null;

  MediaType get mediaType => _mediaType ?? animeState.data?.type ?? mangaState.data?.type ?? MediaType.serie;

  Future<void> refreshFullAnime() async {
    if (_mediaType == null) return;
    resetMedia();
    if (_mediaType!.isAnime) {
      await getAnime();
      await getSeasons();
      await getEpisodes();
    } else {
      await getManga();
    }
  }

  void resetMedia() {
    animeState.set(SignalState<Anime>());
    seasonsState.set(SignalState<List<Season>>());
    episodesState.set(SignalState<List<Episode>>());
    mangaState.set(SignalState<Manga>());
  }

  void disposeMedia() {
    animeState.dispose();
    seasonsState.dispose();
    episodesState.dispose();
  }
}
