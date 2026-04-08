import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class VideoModel {
  final String file;
  final dynamic skip;
  const VideoModel({required this.file, required this.skip});

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
