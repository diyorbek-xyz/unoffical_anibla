import 'package:flutter_dotenv/flutter_dotenv.dart';

List<String> addBaseUrlAsList(List<dynamic>? list) {
  if (list == null) return [];
  return list.map((path) => addBaseUrl(path)).toList();
}

String addBaseUrl(String? path) {
  if (path == null) return "";
  if (path.contains('profile_not_found.png')) return "assets/images/avatar.png";
  if (path.startsWith(dotenv.env['NEW_BASE_URL']!)) {
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
