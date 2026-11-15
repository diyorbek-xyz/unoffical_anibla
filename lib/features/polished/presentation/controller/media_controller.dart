import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/data/video.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/data/source/network/video_api.dart';
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

typedef ChaptersState = BigSignalState<ChapterView, ChaptersQuery>;
typedef ChaptersQuery = (MediaType type, String mediaKey, String? seasonKey, ChapterRequest request);
typedef ChaptersProps = (ChaptersQuery query, Pagination pagination, OnErrorCallback<ChapterView, ChaptersQuery> onError);

class MediaController {
  final AnimeRepository _animeRepository;
  final EpisodeRepository _episodeRepository;
  final SeasonRepository _seasonRepository;
  final BookRepository _bookRepository;
  final VideoApi _videoApi;
  MediaController(this._animeRepository, this._videoApi, this._seasonRepository, this._episodeRepository, this._bookRepository);

  late final _chapters = PaginatedSignal<ChapterView, ChaptersQuery>((a, b, c) => _getChapters((a, b, c)));

  late final media = signal(SignalState<MediaView>());
  late final seasons = signal(SignalState<List<SeasonView>>());
  late final chapterPages = signal(SignalState<List<ChapterPage>>());
  late final chapterVideo = signal(SignalState<Video>());
  FlutterSignal<ChaptersState> get chapters => _chapters.signal;

  Future<void> getFullMedia(MediaProps props) async {
    await getMedia(props.type, props.mediaKey);
    await getSeasons(props.type, props.mediaKey);
    await getChapters(props.type, props.mediaKey, props.seasonKey);
  }

  //$ media
  Future<void> getMedia(MediaType type, String mediaKey) async {
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
    if (type.isAnime) await _getAnimeSeasons(mediaKey);
  }

  Future<void> _getAnimeSeasons(String animeSlug) async {
    final either = await _seasonRepository.getAllSeasons(animeSlug);
    either.fold((l) => seasons.setError(l.message), (r) => seasons.setValue(r.map(SeasonView.fromAnime).toList()));
  }

  //! chapters
  Future<void> getChapters(MediaType type, String mediaKey, [String? seasonKey, ChapterRequest request = const .new()]) async {
    final season = seasons.value.value?.firstOrNull;
    await _chapters.fetch((type, mediaKey, seasonKey?.toNullable() ?? season?.slug.toNullable(), request));
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
    final either = await _bookRepository.getChapters(
      id: query.$2,
      request: query.$4.copyWith(page: pagination.next),
    );
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
    if (query.$3 == null) throw SimpleFailure("Season key is not found");
    final either = await _episodeRepository.getEpisodes(query.$2, query.$3!);
    return either.fold(
      (e) => onError(e.message),
      (r) => BigSignalState(pagination: Pagination(), value: r.map(ChapterView.fromAnime).toList()),
    );
  }

  //! chapter medias
  Future<void> getVideo(String streamUrl) async {
    chapterVideo.setLoading(true);
    try {
      final response = await _videoApi.getVideo(streamUrl);
      chapterVideo.setValue(response.data);
    } catch (e) {
      chapterVideo.setError(e.toString());
    }
  }

  Future<void> getPages(String chapterId) async {
    chapterPages.setLoading(true);
    final either = await _bookRepository.getChapterPages(chapterId);
    either.fold((e) => chapterPages.setError(e.message), (d) => chapterPages.setValue(d.pages));
  }

  void openMedia(BuildContext context, {String? chapterKey, String? seasonKey}) {
    final mediaValue = media.value.value;
    final seasonValue = seasons.value.value?.first;
    final chapterValue = chapters.value.value.firstOrNull;
    if (mediaValue == null || (seasonValue == null && seasonKey == null) || (chapterValue == null && chapterKey == null)) return;
    final mediaType = mediaValue.type;
    final pagePath = mediaValue.type.isAnime ? "watch" : "read";
    final firstKey = mediaValue.key;
    final seconKey = (seasonKey ?? seasonValue?.id)!;
    final thirdKey = (chapterKey ?? chapterValue?.key)!;
    final queries = MediaProps(
      type: mediaType,
      mediaKey: firstKey,
      chapterKey: thirdKey,
      seasonKey: seconKey,
      thumbnail: "",
      heroTag: "",
    ).toJson();
    context.pushNamed(pagePath, queryParameters: queries);
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
