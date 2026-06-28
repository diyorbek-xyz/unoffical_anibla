import 'package:application/features/player/data/services/dowload_hls.dart';
import 'package:flutter_test/flutter_test.dart';

// "/home/user/Temp/downloads/master/index.m3u8"
void main() {
  test("download hls playlist test", () async {
    final master = await DownloadHlsPlaylist.downloadMasterPlaylist(
      "https://anibla.uz/content/stream/anime/iblislar_qotili_film/s05/iblislar_qotili_akaza_tarixi_film_5604/hls/index.m3u8",
      "/home/user/Temp/",
    );
    final media = await DownloadHlsPlaylist.downloadMediaPlaylist(master.variants.first);
    print(media.chunks.first.hls);
    expect("", "");
  });
}
