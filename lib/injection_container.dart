import 'package:application/core/constants/constants.dart';
import 'package:application/features/auth/data/repository/auth_repository_impl.dart';
import 'package:application/features/auth/data/source/remote/login_api.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/calendar/data/models/calendar_model.dart';
import 'package:application/features/calendar/data/repository/calendar_repository_impl.dart';
import 'package:application/features/calendar/data/source/local/calendar_local.dart';
import 'package:application/features/calendar/data/source/remote/calendar_api.dart';
import 'package:application/features/calendar/domain/repository/calendar_repository.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:application/features/slider/data/repository/slider_repository_impl.dart';
import 'package:application/features/slider/data/source/remote/slider_api.dart';
import 'package:application/features/slider/domain/repository/slider_repository.dart';
import 'package:application/features/slider/presentation/bloc/slider_bloc.dart';
import 'package:application/hive_registrar.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:media_kit/media_kit.dart';

final headers = {
  "User-Agent": "okhttp/4.12.0",
  "x-platform": "mobile",
  "Accept-Encoding": "gzip",
  "accept": "application/json",
  "x-platform-os": "android",
  "Host": "amediatv.up-it.uz",
  "x-device": "Redmi 6A",
  "Connection": "Keep-Alive",
  "x-app-version": "2.4.9",
  "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjZmYjliNzcwYzY1MjcxMGJlNTUxZjRmIiwidG9rZW5faWQiOiJkMzAyMDYyOS1hMmUzLTQyYjQtYjkxMy01MjRlNTViM2I3OTgiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNzczNjY0MTMxLCJleHAiOjE3NzQ4NzM3MzF9.eQRqxKBQC70ES3L0dJz0tZxZTOHRPQjuklytMYsLZdM",
};

final sl = GetIt.instance;
final dio = Dio(BaseOptions(baseUrl: "$amediatvBaseUrl/api", headers: headers));

Future<void> initializeDependencies() async {
  await dotenv.load(fileName: '.env');

  await Hive.initFlutter();
  Hive.registerAdapters();

  await initializeDateFormatting('uz');
  MediaKit.ensureInitialized();

  final calendarBox = await Hive.openBox<CalendarModel>("calendarBox");
  sl.registerLazySingleton<Box<CalendarModel>>(() => calendarBox);

  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<DotEnv>(() => dotenv);

  sl.registerLazySingleton<SliderApi>(() => SliderApi(sl()));
  sl.registerLazySingleton<CalendarApi>(() => CalendarApi(sl()));
  sl.registerLazySingleton<LoginApi>(() => LoginApi(sl()));

  sl.registerLazySingleton<CalendarLocal>(() => CalendarLocalImpl(sl()));

  sl.registerLazySingleton<SliderRepository>(() => SliderRepositoryImpl(sl()));
  sl.registerLazySingleton<CalendarRepository>(() => CalendarRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerFactory<SliderBloc>(() => SliderBloc(sl()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<CalendarBloc>(() => CalendarBloc(sl()));
}
