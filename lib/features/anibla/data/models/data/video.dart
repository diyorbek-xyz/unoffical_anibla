import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.g.dart';
part 'video.freezed.dart';

@Freezed(fromJson: true)
abstract class Video with _$Video {
  factory Video({@Default("") String file, @Default("") String skip}) = _Video;
  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
