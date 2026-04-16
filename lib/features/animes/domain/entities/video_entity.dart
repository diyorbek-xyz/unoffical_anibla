import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String file;
  final dynamic skip;
  const VideoEntity({required this.file, required this.skip});

  @override
  List<Object?> get props => [file];
}
