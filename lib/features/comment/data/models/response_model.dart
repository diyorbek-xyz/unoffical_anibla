import 'package:application/features/comment/data/models/comment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class CommentResponseModel {
  final List<CommentModel>? comments;
  final CommentPaginationModel? pagination;
  const CommentResponseModel({this.comments, this.pagination});
  factory CommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentResponseModelToJson(this);
}

@JsonSerializable()
class CommentPaginationModel {
  final int? limit;
  final int? page;
  final int? pages;
  final int? total;
  final int? next;
  const CommentPaginationModel({
    this.limit = 10,
    this.total = 0,
    this.pages = 0,
    this.page = 1,
    this.next = 2,
  });

  factory CommentPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$CommentPaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentPaginationModelToJson(this);
}
