import 'package:equatable/equatable.dart';

class DownloadEntity extends Equatable {
  final String file;
  final String skip;
  final String episodeId;
  const DownloadEntity({
    required this.episodeId,
    required this.file,
    required this.skip,
  });

  @override
  List<Object?> get props => [file, skip, episodeId];
}
