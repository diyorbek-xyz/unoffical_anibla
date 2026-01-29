import 'package:flutter_dotenv/flutter_dotenv.dart';

int parseString(String str) {
  try {
    int integer = int.parse(str);
    return integer;
  } catch (err) {
    return 0;
  }
}

String addBaseUrl(String? path) {
  if (path == null) return "";
  if (path.startsWith(dotenv.env['BASE_URL']!)) {
    return path;
  } else {
    return dotenv.env['BASE_URL']! + path;
  }
}
