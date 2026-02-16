import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/carousel_usecase.dart';
import 'package:application/presentation/bloc/carousel/remote/remote_carousel_event.dart';
import 'package:application/presentation/bloc/carousel/remote/remote_carousel_state.dart';
import 'package:application/presentation/model/carousel_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteCarouselBloc extends Bloc<RemoteCarouselEvent, RemoteCarouselState> {
  final GetCarouselItemsUsecase _getCarouselItemsUsecase;
  RemoteCarouselBloc(this._getCarouselItemsUsecase) : super(RemoteCarouselLoading()) {
    on<GetCarouselItems>(onGetCarouselItems);
  }

  void onGetCarouselItems(GetCarouselItems event, Emitter<RemoteCarouselState> emit) async {
    emit(RemoteCarouselLoading());
    final dataState = await _getCarouselItemsUsecase({});
    if (dataState is DataSuccess) {
      final list = dataState.data!.map((e) => CarouselItemUiModel.fromEntity(e)).toList();
      emit(RemoteCarouselDone(list));
    }
    if (dataState is DataFailed) {
      emit(RemoteCarouselFailed(dataState.exception!));
    }
  }
}
