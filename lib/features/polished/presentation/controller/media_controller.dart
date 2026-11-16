import 'dart:async';

import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/data/video.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/domain/repositories/anime_repository.dart';
import 'package:application/features/anibla/domain/repositories/episode_repository.dart';
import 'package:application/features/anibla/domain/repositories/season_repository.dart';
import 'package:application/features/mano/data/models/data/chapter_page.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/domain/repository/book_repository.dart';
import 'package:application/features/polished/view_models/media/chapter_view.dart';
import 'package:application/features/polished/view_models/media/media_view.dart';
import 'package:application/features/polished/view_models/media/season_view.dart';
import 'package:application/shared/controller/paginated_signal.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';

typedef GetVideoCallback = Future<Video?> Function(String streamUrl);
typedef ChaptersState = BigSignalState<ChapterView, ChaptersQuery>;
typedef ChaptersQuery = (MediaType type, String mediaKey, String? seasonKey, ChapterRequest request);
typedef ChaptersProps = (ChaptersQuery query, Pagination? pagination, OnErrorCallback<ChapterView, ChaptersQuery> onError);

class MediaController {
  final AnimeRepository _animeRepository;
  final EpisodeRepository _episodeRepository;
  final SeasonRepository _seasonRepository;
  final BookRepository _bookRepository;
  MediaController(this._animeRepository, this._seasonRepository, this._episodeRepository, this._bookRepository);

  //# extras
  late final _chapters = PaginatedSignal<ChapterView, ChaptersQuery>(
    (a, b, c) => _getChapters((a, b, c)),
    defaultValue: .generate(10, (index) => ChapterView(type: .serie)),
  );
  MediaProps? _props;

  //$ signals
  late final media = signal(SignalState<MediaView>());
  late final seasons = signal(SignalState<List<SeasonView>>());
  late final chapterPages = signal(SignalState<List<ChapterPage>>());
  late final chapterVideo = signal(SignalState<Video>());
  FlutterSignal<ChaptersState> get chapters => _chapters.signal;

  //$ media
  FutureOr<void> getFullMedia(MediaProps props) async {
    final isLoading = media.isLoading || (props.type.isSerie && (seasons.isLoading || chapters.isLoading));
    final isSame = media.value.value?.key == props.mediaKey;
    if (isLoading || isSame) return;

    String? seasonKey = props.seasonKey?.toNullable();
    _props = props.copyWith(seasonKey: seasonKey);

    await getMedia(props.type, props.mediaKey);

    if (props.type.isMovie) return;
    await getSeasons(props.type, props.mediaKey);
    seasonKey ??= seasons.value.value?.firstOrNull?.slug;
    _props = props.copyWith(seasonKey: seasonKey);
    await getChapters(props.type, props.mediaKey, seasonKey ?? "", .new(limit: 30));
  }

  Future<void> getMedia(MediaType type, String mediaKey) async {
    final isSame = media.value.value?.key == mediaKey;
    if (isSame) return;
    debugPrint('fetching media $type | $mediaKey');
    if (type.isAnime) await _getAnime(type, mediaKey);
    if (type.isBook) await _getBook(type, mediaKey);
  }

  Future<void> _getBook(MediaType type, String bookId) async {
    media.setLoading(true);
    final either = await _bookRepository.getBook(type.toBookRequest, bookId);
    either.fold((e) => media.setError(e.message), (e) => media.setValue(.fromBook(e)));
  }

  Future<void> _getAnime(MediaType type, String animeSlug) async {
    media.setLoading(true);
    final either = await _animeRepository.getSerie(type, animeSlug);
    either.fold((e) => media.setError(e.message), (e) => media.setValue(.fromAnime(e)));
  }

  //! seasons
  Future<void> getSeasons(MediaType type, String mediaKey) async {
    if (seasons.isLoading) return;
    debugPrint('fetching seasons of $type | $mediaKey');
    if (type.isAnime) await _getAnimeSeasons(mediaKey);
  }

  Future<void> _getAnimeSeasons(String animeSlug) async {
    final either = await _seasonRepository.getAllSeasons(animeSlug);
    either.fold((l) => seasons.setError(l.message), (r) => seasons.setValue(r.map(SeasonView.fromAnime).toList()));
  }

  //! chapters
  Future<void> getChapters(MediaType type, String mediaKey, String seasonKey, ChapterRequest request) async {
    if (chapters.isLoading) return;
    debugPrint('fetching chapters of $type season | $seasonKey, $mediaKey,\n\t- request ${request.toJson()}');
    await _chapters.fetch((type, mediaKey, seasonKey.toNullable(), request));
  }

  Future<ChaptersState> _getChapters(ChaptersProps props) async {
    if (props.$1.$1.isBook) return await _getBookChapters(props);
    if (props.$1.$1.isAnime) return await _getAnimeChapters(props);
    return BigSignalState();
  }

  Future<ChaptersState> _getBookChapters(ChaptersProps props) async {
    final query = props.$1;
    final pagination = props.$2;
    final onError = props.$3;
    final either = await _bookRepository.getChapters(id: query.$2, request: query.$4.copyPagination(pagination));
    return either.fold(
      (l) => onError(l.message),
      (r) => BigSignalState(
        pagination: .new(limit: r.limit, page: r.offset, total: r.total, pages: (r.total / r.limit).ceil()),
        value: r.chapters.map((e) => ChapterView.fromBook(e, type: media.value.value?.type)).toList(),
      ),
    );
  }

  Future<ChaptersState> _getAnimeChapters(ChaptersProps props) async {
    final query = props.$1;
    final onError = props.$3;
    if (query.$3 == null) return onError("Season key is not found");
    final either = await _episodeRepository.getEpisodes(query.$2, query.$3!);
    return either.fold(
      (e) => onError(e.message),
      (r) => BigSignalState(
        pagination: Pagination(),
        value: r.map((e) => ChapterView.fromAnime(e, total: r.length)).toList(),
      ),
    );
  }

  //! chapter medias
  Future<Video?> getVideo(String streamUrl) async {
    debugPrint('fetching stream | $streamUrl');
    chapterVideo.setLoading(true);
    final either = await _episodeRepository.getVideo(streamUrl.replaceFirst("/anibla.uz/", "/media.anibla.uz/"));
    return either.fold(
      (e) {
        chapterVideo.setError(e.message);
        return null;
      },
      (e) {
        chapterVideo.setValue(e);
        return e;
      },
    );
  }

  Future<Video?> getVideoForced(MediaProps props) async {
    chapterVideo.setLoading(true);
    await getFullMedia(props);
    final chapter = chapters.value.value.where((element) => element.key == props.chapterKey).singleOrNull;
    final streamUrl = chapter?.mediaUrl.toNullable();
    debugPrint('fetching stream | $streamUrl');
    if (streamUrl == null) chapterVideo.setError("Stream url is not found");
    return await getVideo(streamUrl!);
  }

  Future<void> getPages(String chapterId) async {
    debugPrint('fetching chapter pages | $chapterId');
    chapterPages.setLoading(true);
    final either = await _bookRepository.getChapterPages(chapterId);
    either.fold((e) => chapterPages.setError(e.message), (d) => chapterPages.setValue(d.pages));
  }

  void openMedia(BuildContext context, {String? chapterKey, String? seasonKey}) {
    print("object");
    final mediaValue = media.value.value;
    final seasonValue = seasons.value.value?.first;
    final chapterValue = chapters.value.value.firstOrNull;
    if (mediaValue == null) return;
    print(mediaValue);
    final mediaType = mediaValue.type;
    print(mediaType);
    if (mediaType.isSerie && ((seasonValue == null && seasonKey == null) || (chapterValue == null && chapterKey == null))) return;
    final pagePath = mediaValue.type.isAnime ? "watch" : "read";
    final firstKey = mediaValue.key;
    final seconKey = seasonKey ?? seasonValue?.id;
    final thirdKey = chapterKey ?? chapterValue?.key;
    final queries = MediaProps(type: mediaType, mediaKey: firstKey, chapterKey: thirdKey, seasonKey: seconKey).toJson();
    context.pushNamed(pagePath, queryParameters: queries);
  }

  //$ refreshes
  Future<void> refreshFullMedia() async {
    if (_props != null) await getFullMedia(_props!);
  }

  Future<void> refreshMedia() async {
    if (_props != null) await getMedia(_props!.type, _props!.mediaKey);
  }

  Future<void> refreshSeasons() async {
    if (_props != null) await getSeasons(_props!.type, _props!.mediaKey);
  }

  Future<void> refreshChapters([ChapterRequest request = const .new()]) async {
    if (_props != null) await getChapters(_props!.type, _props!.mediaKey, _props!.seasonKey ?? "", request);
  }

  //$ cleanup
  void dispose() {
    media.dispose();
    seasons.dispose();
    chapters.dispose();
    chapterPages.dispose();
    chapterVideo.dispose();
  }
}
