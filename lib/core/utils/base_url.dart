import 'package:flutter_dotenv/flutter_dotenv.dart';

List<String> addBaseUrlAsList(List<dynamic>? list) {
  if (list == null) return [];
  return list.map((path) => addBaseUrl(path)).toList();
}

String addBaseUrl(String? path) {
  if (path == null) return "";
  if (path.contains('profile_not_found.png')) {
    return "https://i.pinimg.com/736x/15/0f/a8/150fa8800b0a0d5633abc1d1c4db3d87.jpg";
  }
  if (path.startsWith(dotenv.env['NEW_BASE_URL']!) || path.startsWith("https:")) {
    return path;
  } else if (path.startsWith("/")) {
    return dotenv.env['NEW_BASE_URL']! + path;
  } else {
    return "${dotenv.env['NEW_BASE_URL']}/$path";
  }
}

bool hasBaseUrl(String? path) {
  return path?.contains(dotenv.env['NEW_BASE_URL']!) ?? false;
}

String getStreamId(String path) {
  final url = Uri.parse(path);
  return url.pathSegments.last;
}
