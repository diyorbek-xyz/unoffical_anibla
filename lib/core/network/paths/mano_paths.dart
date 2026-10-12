import 'package:flutter_dotenv/flutter_dotenv.dart';

class ManoPaths {
  static final baseUrl = dotenv.env['MANO_URL'] ?? "";
  static const refreshToken = "/v2/user/refresh";
}
