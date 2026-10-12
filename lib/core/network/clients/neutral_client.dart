import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class NeutralClient extends DioForNative {
  NeutralClient() : super(baseOptions);

  static final baseOptions = BaseOptions(headers: headers);
  static const headers = {
    "User-Agent": "okhttp/4.12.0",
    "Accept-Encoding": "gzip",
    "accept": "application/json",
    "Connection": "Keep-Alive",
  };
}
