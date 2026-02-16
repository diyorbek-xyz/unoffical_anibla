import 'package:application/presentation/model/carousel_ui.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class RemoteCarouselState extends Equatable {
  final List<CarouselItemUiModel>? carouselItemList;
  final DioException? exception;
  const RemoteCarouselState({this.carouselItemList, this.exception});

  @override
  List<Object?> get props => [carouselItemList, exception];
}

final class RemoteCarouselLoading extends RemoteCarouselState {
  const RemoteCarouselLoading();
}

final class RemoteCarouselDone extends RemoteCarouselState {
  const RemoteCarouselDone(List<CarouselItemUiModel> list) : super(carouselItemList: list);
}

final class RemoteCarouselFailed extends RemoteCarouselState {
  const RemoteCarouselFailed(DioException exception) : super(exception: exception);
}
