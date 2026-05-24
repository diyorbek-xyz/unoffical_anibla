import 'package:application/features/comment/domain/repository/comment_repository.dart';
import 'package:application/features/comment/presentation/bloc/comment_event.dart';
import 'package:application/features/comment/presentation/bloc/comment_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository repository;
  CommentBloc(this.repository) : super(CommentState(state: .initial)) {
    on<GetComments>(onGetComments);
    on<InitComments>(init);
  }

  void init(InitComments event, Emitter<CommentState> emit) {
    emit(state.copyWith(props: event.props, state: .ready));
  }

  void onGetComments(GetComments event, Emitter<CommentState> emit) async {
    print("fetching");
    if (state.state == .initial) return;
    final newState = state.copyWith(state: .loading);
    emit(newState);
    final oldData = state.response;
    final isFirstFetch = oldData == null;
    final props = state.props!.copyWith(page: isFirstFetch ? 1 : oldData.pagination.next);
    final either = await repository.getAnimeComments(props);
    print("fetched");
    emit(
      either.fold(
        (failure) => newState.copyWith(state: .error, error: ExceptionMapper.mapFailureToMessage(failure)),
        (success) => newState.copyWith(
          props: props,
          state: success.pagination.pages == success.pagination.page ? .endReached : .success,
          response: isFirstFetch
              ? success
              : oldData.copyWith(comments: oldData.comments.followedBy(success.comments).toList(), pagination: success.pagination),
        ),
      ),
    );
  }
}
