import 'package:application/core/resources/response_model.dart';
import 'package:application/data/models/other/carousel_model.dart';
import 'package:application/domain/entities/other/carousel_entity.dart';

class CarouselResponseModel extends ResponseModel<List<CarouselItemModel>> {
  const CarouselResponseModel({required super.data, required super.message, required super.success});
  factory CarouselResponseModel.fromJson(Map<String, dynamic> json) {
    List<CarouselItemModel> list = json['data'] != null ? (json['data'] as List).map((e) => CarouselItemModel.fromJson(e)).toList() : [];
    return CarouselResponseModel(data: list, success: json['success'], message: json['message']);
  }
  List<CarouselItemEntity> getEntityList() {
    return data.map((e) => e.toEntity()).toList();
  }
}
