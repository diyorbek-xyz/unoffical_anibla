import 'package:application/features/anibla/data/models/data/history_item.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/request/animes_query.dart';
import 'package:application/features/anibla/domain/repositories/anime_repository.dart';
import 'package:application/shared/controller/paginated_signal.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AnimeFeedController {
  final AnimeRepository _animeRepository;
  AnimeFeedController(this._animeRepository);

  late final homeAnimes = PaginatedSignal<Anime, AnimesQuery>((query, pagination, _) async {
    final either = await _animeRepository.getHomeAnimes(query.copyPagination(pagination));
    final data = either.getData();
    return BigSignalState(value: data.datas, pagination: data.pagination);
  });

  late final watchHistory = futureSignal(() async {
    final either = await _animeRepository.getWatchHistory();
    return either.getData();
  });
  final fakeHistory = List.generate(6, (index) => HistoryItem());
}
