import 'package:application/core/network/clients/mano_client.dart';

List<String> addBaseUrlAsList(List<dynamic>? list) {
  if (list == null) return [];
  return list.map((path) => addBaseUrl(path)).toList();
}

String addBaseUrl(String? path) {
  if (path == null) return "";
  if (path.contains('profile_not_found.png')) {
    return "https://i.pinimg.com/736x/15/0f/a8/150fa8800b0a0d5633abc1d1c4db3d87.jpg";
  }
  if (path.startsWith(AMEDIA_URL) || path.startsWith("https:")) {
    return path;
  } else if (path.startsWith("/")) {
    return AMEDIA_URL + path;
  } else {
    return "$AMEDIA_URL/$path";
  }
}

bool hasBaseUrl(String? path) {
  return (path?.contains(AMEDIA_URL) ?? false) || (path?.startsWith("https:") ?? false);
}

bool isUsable(String? path) {
  return hasBaseUrl(path) && !(path?.endsWith(".avif") ?? true);
}

String getStreamId(String path) {
  if (path.isEmpty) return "";
  final url = Uri.parse(path);
  return url.pathSegments.last;
}
