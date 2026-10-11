import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AniblaClient extends DioForNative {
  AniblaClient() : super(baseOptions);
  static final baseOptions = BaseOptions(baseUrl: "${dotenv.env["AMEDIA_URL"]!}/api", headers: headers);
  static const headers = {
    "User-Agent": "okhttp/4.12.0",
    "Accept-Encoding": "gzip",
    "accept": "application/json",
    "Connection": "Keep-Alive",
    "x-platform": "desktop",
    "x-platform-os": "arch",
    "x-device": "Arch Linux",
    "x-app-version": "2.4.9",
  };
}
