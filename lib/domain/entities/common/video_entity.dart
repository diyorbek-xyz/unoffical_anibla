import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String? file;
  final int? introStart;
  final int? introEnd;

  const VideoEntity({this.file, this.introStart, this.introEnd});

  @override
  List<Object?> get props => [file, introEnd, introStart];
}
