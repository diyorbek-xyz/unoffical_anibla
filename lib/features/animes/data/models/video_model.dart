import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  final String? file;
  final dynamic skip;
  const VideoModel({this.file, this.skip});
  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
