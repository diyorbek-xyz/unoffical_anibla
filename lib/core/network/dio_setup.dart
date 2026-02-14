import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio dio = Dio(
  BaseOptions(
    sendTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 30),
    baseUrl: dotenv.env['BASE_URL'] != null ? "${dotenv.env['BASE_URL']}/api" : "",
    headers: {
      "Content-Type": Headers.jsonContentType,
      "Accept": Headers.acceptHeader,
      "User-Agent": "Mozilla/5.0",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2OTcyNGUxODI1ZmFhZWEzMjlhMmY2M2YiLCJsb2dpbiI6ImRpeW9yYmVrIiwiaWF0IjoxNzY5MDk4Nzk2LCJleHAiOjE4MDA2NTYzOTZ9.9Ggd-r9oVoKM72tIp9zD6JUPG5TtQHlSfXVWt5lEuWU",
    },
  ),
);
Dio newDio = Dio(
  BaseOptions(
    sendTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 30),
    baseUrl: dotenv.env['NEW_BASE_URL'] != null ? "${dotenv.env['NEW_BASE_URL']}/api" : "",
    headers: {
      "Content-Type": Headers.jsonContentType,
      "Accept": Headers.acceptHeader,
      "User-Agent": "Mozilla/5.0",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2OTcyNGUxODI1ZmFhZWEzMjlhMmY2M2YiLCJsb2dpbiI6ImRpeW9yYmVrIiwiaWF0IjoxNzY5MDk4Nzk2LCJleHAiOjE4MDA2NTYzOTZ9.9Ggd-r9oVoKM72tIp9zD6JUPG5TtQHlSfXVWt5lEuWU",
    },
  ),
);
