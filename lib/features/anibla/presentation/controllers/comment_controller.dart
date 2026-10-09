import 'package:application/features/anibla/data/models/data/comment.dart';
import 'package:application/features/anibla/domain/repositories/comment_repository.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/shared/controller/signal_state.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CommentController {
  final MediaController _mediaController;
  final CommentRepository _animeCommentRepo;
  CommentController(this._mediaController, this._animeCommentRepo);

  final animeCommentsState = signal(BigSignalState<Comment>());
  final animeRepliesState = signal(NamedSignalState<Comment>());

  final mangaCommentsState = signal(BigSignalState());
  final fakeComments = List.generate(5, (index) => Comment());

  Future<void> getAnimeComments([int limit = 20]) async {
    if (animeCommentsState.hasValue && !animeCommentsState.value.pagination.hasMore) return;
    if (animeCommentsState.isLoading) return;
    final anime = _mediaController.animeState.data;
    if (anime == null) return;
    animeCommentsState.setLoading(true);
    final oldState = animeCommentsState.value;
    final either = await _animeCommentRepo.getAnimeComments(
      .new(id: anime.id, limit: limit, page: oldState.pagination.next, type: anime.type),
    );
    either.fold((l) => animeCommentsState.setError(l.message), (r) => animeCommentsState.setMore(r.pagination, r.comments));
  }

  Future<void> getAnimeReplies(String id) async {
    if (animeRepliesState.getIsLoading(id)) return;
    animeRepliesState.setLoading(id, true);

    final either = await _animeCommentRepo.getReplies(id);
    either.fold(
      (l) => animeRepliesState.setError(id, l.message),
      (r) => animeRepliesState.setEntry(id, r.pagination, r.comments),
    );
  }

  void resetAll() {
    animeCommentsState.set(BigSignalState<Comment>());
    mangaCommentsState.set(BigSignalState<Comment>());
    animeRepliesState.set(NamedSignalState<Comment>());
  }
}
