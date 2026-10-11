import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'parser_models.freezed.dart';
part 'parser_models.g.dart';

@HiveType(typeId: 544)
@freezed
sealed class MasterPlaylist with _$MasterPlaylist {
  const MasterPlaylist._();
  factory MasterPlaylist({
    @HiveField(0) required List<Variant> variants,
    @HiveField(1) required int version,
    @HiveField(2) required String downloadUrl,
    @HiveField(3) required String localUrl,
  }) = _MasterPlaylist;

  String get hls {
    String hls = "#EXTM3U";
    hls += "\n#EXT-X-VERSION:$version";
    hls += variants.map((e) => e.hls).join();
    return hls;
  }
}

@freezed
@HiveType(typeId: 3725)
sealed class MediaPlaylist with _$MediaPlaylist {
  const MediaPlaylist._();
  factory MediaPlaylist({
    @HiveField(0) required List<Chunk> chunks,
    @HiveField(1) required String downloadUrl,
    @HiveField(2) required String localUrl,
    @HiveField(3) required double targetDuration,
    @HiveField(4) required String type,
    @HiveField(5) required int version,
    @HiveField(6) required int startIndex,
    @HiveField(7) required int bandwidth,
    @HiveField(8) required int height,
    @HiveField(9) required int width,
    @HiveField(10) required dynamic codecs,
  }) = _MediaPlaylist;

  double get duration => targetDuration * (chunks.length - 1);
  double get sizeByte => (duration * bandwidth) / 8;
  String get hls {
    String hls = "#EXTM3U";
    hls += "\n#EXT-X-VERSION:$version";
    hls += "\n#EXT-X-PLAYLIST-TYPE:$type";
    hls += "\n#EXT-X-TARGETDURATION:$targetDuration";
    hls += "\n#EXT-X-MEDIA-SEQUENCE:$startIndex";
    hls += chunks.map((e) => e.hls).join();
    hls += "\n#EXT-X-ENDLIST";
    return hls;
  }
}

@freezed
@HiveType(typeId: 763)
sealed class Chunk with _$Chunk {
  const Chunk._();
  factory Chunk({
    @HiveField(0) required String downloadUrl,
    @HiveField(1) required double duration,
    @HiveField(2) required String localUrl,
    @HiveField(3) required String relativeUrl,
  }) = _Chunk;

  String get hls => "\n#EXTINF:$duration,\n$relativeUrl";
}

@freezed
@HiveType(typeId: 3513)
sealed class Variant with _$Variant {
  const Variant._();
  factory Variant({
    @HiveField(0) required int bandwidth,
    @HiveField(1) required String codecs,
    @HiveField(2) required int height,
    @HiveField(3) required int width,
    @HiveField(4) required String localUrl,
    @HiveField(5) required String downloadUrl,
    @HiveField(6) required String relativeUrl,
  }) = _Variant;

  String get hls => "\n#EXT-X-STREAM-INF:BANDWIDTH=$bandwidth,CODECS=$codecs,RESOLUTION=${width}x$height\n$relativeUrl";
}

@freezed
@HiveType(typeId: 4355)
sealed class ExtraInfos with _$ExtraInfos {
  factory ExtraInfos({
    @HiveField(0) required double totalDuration,
    @HiveField(1) required double totalSize,
    @HiveField(2) required int bandwidth,
  }) = _ExtraInfos;
}
