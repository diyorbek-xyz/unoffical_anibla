import 'package:application/features/animes/domain/repository/episode_repository.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_event.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/player/data/source/local/timeline.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeRepository _episodeRepository;
  final Timeline _timelineLocal;
  EpisodeBloc(this._episodeRepository, this._timelineLocal) : super(EpisodeInitial()) {
    on<GetEpisodes>(onGetEpisodes);
  }

  void onGetEpisodes(GetEpisodes event, Emitter<EpisodeState> emit) async {
    if ((state is EpisodeSuccess || state is EpisodeLoading)) {
      return;
    }
    emit(EpisodeLoading());
    final either = await _episodeRepository.getEpisodes(event.animeSlug, event.seasonSlug);
    emit(
      either.fold(
        (failure) => EpisodeFailure(ExceptionMapper.mapFailureToMessage(failure)),
        (success) => EpisodeSuccess(
          success
              .skipWhile((e) => e.episodeNumber < 1)
              .map((e) => e.copyWith(timeline: _timelineLocal.getTimeline(e.id)))
              .toList(),
        ),
      ),
    );
  }
}
