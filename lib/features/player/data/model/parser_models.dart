import 'package:hive_ce/hive_ce.dart';

part 'parser_models.g.dart';

@HiveType(typeId: 544)
class MasterPlaylist {
  @HiveField(0)
  final String downloadUrl;
  @HiveField(1)
  final String localUrl;
  @HiveField(2)
  final List<Variant> variants;
  @HiveField(3)
  final int version;
  const MasterPlaylist({required this.variants, required this.version, required this.downloadUrl, required this.localUrl});

  String toHLS() {
    String hls = "#EXTM3U";
    hls += "\n#EXT-X-VERSION:$version";
    hls += variants.map((e) => e.toHLS()).join();
    return hls;
  }
}

@HiveType(typeId: 792)
class MediaPlaylist {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final int version;
  @HiveField(2)
  final double targetDuration;
  @HiveField(3)
  final int startIndex;
  @HiveField(4)
  final List<Chunk> chunks;
  @HiveField(5)
  final String downloadUrl;
  @HiveField(6)
  final String localUrl;
  const MediaPlaylist({
    required this.chunks,
    required this.downloadUrl,
    required this.localUrl,
    required this.targetDuration,
    required this.type,
    required this.version,
    required this.startIndex,
  });

  String toHLS() {
    String hls = "#EXTM3U";
    hls += "\n#EXT-X-VERSION:$version";
    hls += "\n#EXT-X-PLAYLIST-TYPE:$type";
    hls += "\n#EXT-X-TARGETDURATION:$targetDuration";
    hls += "\n#EXT-X-MEDIA-SEQUENCE:$startIndex";
    hls += chunks.map((e) => e.toHLS()).join();
    hls += "\n#EXT-X-ENDLIST";
    return hls;
  }
}

@HiveType(typeId: 763)
class Chunk {
  @HiveField(0)
  final double duration;
  @HiveField(1)
  final String downloadUrl;
  @HiveField(2)
  final String localUrl;
  @HiveField(3)
  final String relativeUrl;
  const Chunk({required this.downloadUrl, required this.duration, required this.localUrl, required this.relativeUrl});

  String toHLS() {
    return "\n#EXTINF:$duration,\n$relativeUrl";
  }
}

@HiveType(typeId: 3513)
class Variant {
  @HiveField(0)
  final int bandwidth;
  @HiveField(1)
  final String codecs;
  @HiveField(2)
  final int height;
  @HiveField(3)
  final int width;
  @HiveField(4)
  final String downloadUrl;
  @HiveField(5)
  final String localUrl;
  @HiveField(6)
  final String relativeUrl;
  const Variant({
    required this.bandwidth,
    required this.codecs,
    required this.height,
    required this.width,
    required this.localUrl,
    required this.downloadUrl,
    required this.relativeUrl,
  });

  String toHLS() {
    return "\n#EXT-X-STREAM-INF:BANDWIDTH=$bandwidth,CODECS=$codecs,RESOLUTION=${width}x$height\n$relativeUrl";
  }
}

@HiveType(typeId: 4355)
class ExtraInfos {
  @HiveField(0)
  final double totalDuration;
  @HiveField(1)
  final double totalSize;
  @HiveField(2)
  final int bandwidth;
  const ExtraInfos({required this.totalDuration, required this.totalSize, required this.bandwidth});
}
