import 'package:application/features/comment/domain/repository/comment_repository.dart';
import 'package:application/features/comment/presentation/bloc/comment_event.dart';
import 'package:application/features/comment/presentation/bloc/comment_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository repository;
  CommentBloc(this.repository) : super(CommentInitial()) {
    on<GetComments>(onGetComments);
  }
  void onGetComments(GetComments event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    final either = await repository.getAnimeComments(event.props);
    emit(
      either.fold(
        (failure) => CommentError(ExceptionMapper.mapFailureToMessage(failure)),
        (success) => CommentSuccess(success),
      ),
    );
  }
}
