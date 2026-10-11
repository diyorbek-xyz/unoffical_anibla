import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ManoClient extends DioForNative {
  ManoClient() : super(baseOptions);

  static final baseOptions = BaseOptions(baseUrl: dotenv.env["MANO_URL"]!, headers: headers);
  static const headers = {
    "User-Agent": "okhttp/4.12.0",
    "Accept-Encoding": "gzip",
    "accept": "application/json",
    "Connection": "Keep-Alive",
    "x-platform": "desktop",
    "x-platform-os": "arch",
    "x-device": "Arch Linux",
    "x-app-version": "2.4.9",
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJhYjk3NWNjMS00M2Y4LTQyYTItOWQyYy04YmMxZjBhZWM1ZDAiLCJ0eXBlIjoiYWNjZXNzIiwicm9sZXMiOlsiZTQ4NmU4MDItNTYxMS00Njg4LWFhZTgtNTU2YzU2N2NlOTE0Il0sImV4cCI6MTc5MTcxMjAxNCwibmJmIjoxNzkxNzExMTE0LCJpYXQiOjE3OTE3MTExMTQsImp0aSI6IjlmOGUzMDQ2LTk2OTQtNDA3OS04YjIyLWM5ZmUwYWVlODI2OSJ9.-jGuRix4wUpyvKfgKtupjbTvTypxrtn84Wn0cwRylzM",
  };
}
