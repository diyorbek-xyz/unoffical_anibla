import 'package:application/features/player/data/model/parser_models.dart';

class ParseHlsPlaylist {
  static MasterPlaylist parseMaster({required String data, required String downloadUrl, required String localFolder}) {
    final regex = RegExp(r'(^#.*(?:\n(?!#).+)*)', multiLine: true);
    final datas = regex.allMatches(data).map((e) => e.group(0)!).toList();
    final variantsStr = datas.where((e) => e.startsWith("#EXT-X-STREAM-INF:")).toList();
    final othersStr = datas.where((e) => !e.startsWith("#EXT-X-STREAM-INF:")).toList();
    final variants = variantsStr.map((e) => parseVariant(data: e, masterUrl: downloadUrl, localUrl: localFolder)).toList();
    final others = othersStr.map((e) => e.split(":"));
    final xVersion = others.firstWhere((e) => e.contains("#EXT-X-VERSION"), orElse: () => ["", "3"])[1];
    return MasterPlaylist(
      variants: variants,
      version: int.tryParse(xVersion) ?? 3,
      downloadUrl: downloadUrl,
      localUrl: Uri.parse(localFolder).resolve(Uri.parse(downloadUrl).pathSegments.last).toString(),
    );
  }

  static Variant parseVariant({required String data, required String masterUrl, required String localUrl}) {
    final [infosStr, value] = data.split("\n");
    final infos = infosStr.substring(data.lastIndexOf("#EXT-X-STREAM-INF:") + 18, null).split(RegExp(r',(?=(?:[^"]*"[^"]*")*[^"]*$)'));
    final bandwidth = infos.firstWhere((e) => e.contains("BANDWIDTH"), orElse: () => "BANDWIDTH=null").substring("BANDWIDTH=".length);
    final codecs = infos.firstWhere((e) => e.contains("CODECS"), orElse: () => "CODECS=null").substring("CODECS=".length);
    final resolution = infos.firstWhere((e) => e.contains("RESOLUTION"), orElse: () => "RESOLUTION=0x0").substring("RESOLUTION=".length).split("x");
    final fileName = Uri.parse(value).pathSegments.last;
    final localFile = Uri(pathSegments: [resolution.first, fileName]);
    final masterUri = Uri.parse(masterUrl);
    final localUri = Uri.parse(localUrl);
    final variant = Variant(
      relativeUrl: localFile.toString(),
      localUrl: localUri.resolveUri(localFile).toString(),
      downloadUrl: masterUri.resolve(value).toString(),
      codecs: codecs,
      bandwidth: int.tryParse(bandwidth) ?? 0,
      height: int.tryParse(resolution[0]) ?? 0,
      width: int.tryParse(resolution[1]) ?? 0,
    );
    return variant;
  }

  static MediaPlaylist parseMedia({required String data, required String downloadUrl, required String localFolder}) {
    final regex = RegExp(r'(^#.*(?:\n(?!#).+)*)', multiLine: true);
    final datas = regex.allMatches(data).map((e) => e.group(0)!).toList();
    final chunksStr = datas.where((e) => e.startsWith("#EXTINF:")).toList();
    final othersStr = datas.where((e) => !e.startsWith("#EXTINF:")).toList();
    final chunks = chunksStr.map((e) => parseChunk(data: e, downloadUrl: downloadUrl, localUrl: localFolder)).toList();
    final others = othersStr.map((e) => e.split(":"));
    final xVersion = others.firstWhere((e) => e.contains("#EXT-X-VERSION"), orElse: () => ["", "3"])[1];
    final xType = others.firstWhere((e) => e.contains("#EXT-X-PLAYLIST-TYPE"), orElse: () => ["", "VOD"])[1];
    final xTargetDuration = others.firstWhere((e) => e.contains("#EXT-X-TARGETDURATION"), orElse: () => ["", ""])[1];
    final xStartIndex = others.firstWhere((e) => e.contains("#EXT-X-MEDIA-SEQUENCE"), orElse: () => ["", "0"])[1];
    final downloadUri = Uri.parse(downloadUrl);
    final localUri = Uri.parse(localFolder);
    return MediaPlaylist(
      downloadUrl: downloadUrl,
      localUrl: localUri.resolve(downloadUri.pathSegments.last).toString(),
      chunks: chunks,
      targetDuration: double.tryParse(xTargetDuration) ?? 0,
      startIndex: int.tryParse(xStartIndex) ?? 0,
      type: xType,
      version: int.parse(xVersion),
    );
  }

  static ExtraInfos getExtraInfos({required Variant variant, required MediaPlaylist media}) {
    final totalDuration = media.chunks.fold(0.0, (v, e) => v + e.duration);
    final totalSize = (variant.bandwidth * totalDuration) / 8;
    return ExtraInfos(totalDuration: totalDuration, totalSize: totalSize, bandwidth: variant.bandwidth);
  }

  static Chunk parseChunk({required String data, required String downloadUrl, required String localUrl}) {
    final [infoStr, value] = data.split(",\n");
    final duration = double.tryParse(infoStr.split(":").last) ?? 0;
    final fileName = Uri.parse(value).pathSegments.last;
    final localFile = Uri(pathSegments: ['chunks', fileName]);
    final localUri = Uri.parse(localUrl);
    final downloadUri = Uri.parse(downloadUrl);
    return Chunk(
      downloadUrl: downloadUri.resolve(value).toString(),
      localUrl: localUri.resolveUri(localFile).toString(),
      relativeUrl: localFile.toString(),
      duration: duration,
    );
  }

  static bool checkIsMaster(String data) {
    return !(data.contains("#EXT-X-PLAYLIST-TYPE:") || data.contains("#EXT-X-TARGETDURATION:"));
  }
}
