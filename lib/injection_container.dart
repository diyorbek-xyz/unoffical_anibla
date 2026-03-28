import 'package:application/core/constants/constants.dart';
import 'package:application/features/profile/data/models/account_model.dart';
import 'package:application/features/profile/data/source/local/profile_local.dart';
import 'package:application/features/profile/presentation/bloc/session/session_bloc.dart';
import 'package:application/network/interceptors/auth_interceptor.dart';
import 'package:application/network/interceptors/error_interceptor.dart';
import 'package:application/features/auth/data/repository/auth_repository_impl.dart';
import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:application/features/auth/data/source/remote/auth_api.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/calendar/data/models/calendar_model.dart';
import 'package:application/features/calendar/data/repository/calendar_repository_impl.dart';
import 'package:application/features/calendar/data/source/local/calendar_local.dart';
import 'package:application/features/calendar/data/source/remote/calendar_api.dart';
import 'package:application/features/calendar/domain/repository/calendar_repository.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:application/features/profile/data/repository/account_repository_impl.dart';
import 'package:application/features/profile/data/source/remote/profile_api.dart';
import 'package:application/features/profile/domain/repository/profile_repository.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/slider/data/repository/slider_repository_impl.dart';
import 'package:application/features/slider/data/source/remote/slider_api.dart';
import 'package:application/features/slider/domain/repository/slider_repository.dart';
import 'package:application/features/slider/presentation/bloc/slider_bloc.dart';
import 'package:application/hive_registrar.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';

final sl = GetIt.instance;
final dio = Dio(
  BaseOptions(
    baseUrl: "$amediatvBaseUrl/api",
    headers: {
      "User-Agent": "okhttp/4.12.0",
      "Accept-Encoding": "gzip",
      "accept": "application/json",
      "Host": "amediatv.up-it.uz",
      "Connection": "Keep-Alive",
      "x-platform": "mobile",
      "x-platform-os": "android",
      "x-device": "Redmi 6A",
      "x-app-version": "2.4.9",
    },
  ),
);
final secureStorage = FlutterSecureStorage();

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Setup local Storage;
  await Hive.initFlutter();
  Hive.registerAdapters();

  // Setup miscs;
  await dotenv.load(fileName: '.env');
  await initializeDateFormatting('uz');

  // Open boxes;
  final calendarBox = await Hive.openBox<CalendarModel>("calendarBox");
  final profileBox = await Hive.openBox<AccountModel>("profileBox");

  // Register / Setup network logic;
  sl.registerSingleton<FlutterSecureStorage>(secureStorage);
  sl.registerSingleton<AuthStorage>(AuthStorageImpl(sl()));
  sl.registerLazySingleton<ErrorInterceptor>(() => ErrorInterceptor());
  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(sl()));
  dio.interceptors.add(sl<ErrorInterceptor>());
  dio.interceptors.add(sl<AuthInterceptor>());

  // Register local storages;
  sl.registerSingleton<Box<CalendarModel>>(calendarBox);
  sl.registerSingleton<Box<AccountModel>>(profileBox);

  // Register miscs;
  sl.registerSingleton<Dio>(dio);
  sl.registerSingleton<DotEnv>(dotenv);

  // Register remote Api Services;
  sl.registerSingleton<SliderApi>(SliderApi(sl()));
  sl.registerSingleton<CalendarApi>(CalendarApi(sl()));
  sl.registerSingleton<AuthApi>(AuthApi(sl()));
  sl.registerSingleton<ProfileApi>(ProfileApi(sl()));

  // Register Local Storage Services;
  sl.registerSingleton<CalendarLocal>(CalendarLocalImpl(sl()));
  sl.registerSingleton<ProfileLocal>(ProfileLocalImpl(sl()));

  // Register Repositories;
  sl.registerSingleton<SliderRepository>(SliderRepositoryImpl(sl()));
  sl.registerSingleton<CalendarRepository>(CalendarRepositoryImpl(sl(), sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));
  sl.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(sl(), sl(), sl()));

  // Register State managers;
  sl.registerFactory<SliderBloc>(() => SliderBloc(sl()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<CalendarBloc>(() => CalendarBloc(sl()));
  sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl()));
  sl.registerFactory<SessionBloc>(() => SessionBloc(sl()));
}
