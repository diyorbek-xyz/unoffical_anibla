import 'package:application/core/utils/utils.dart';
import 'package:application/features/player/data/model/download_models.dart';
import 'package:application/features/player/data/model/timeline_model.dart';
import 'package:application/features/player/data/services/download_service.dart';
import 'package:application/features/player/data/source/local/downloads.dart';
import 'package:application/features/player/data/source/local/timeline.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:application/core/constants/constants.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/repository/anime_repository_impl.dart';
import 'package:application/features/animes/data/repository/episode_repository_impl.dart';
import 'package:application/features/animes/data/repository/season_repository_impl.dart';
import 'package:application/features/animes/data/source/remote/anime_api.dart';
import 'package:application/features/animes/data/source/remote/episode_api.dart';
import 'package:application/features/animes/data/source/remote/season_api.dart';
import 'package:application/features/animes/data/source/remote/video_api.dart';
import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/features/animes/domain/repository/episode_repository.dart';
import 'package:application/features/animes/domain/repository/season_repository.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/season/season_bloc.dart';
import 'package:application/features/animes/presentation/bloc/video/video_bloc.dart';
import 'package:application/features/comment/data/repository/comment_repository_impl.dart';
import 'package:application/features/comment/data/source/remote/comment_api.dart';
import 'package:application/features/comment/domain/repository/comment_repository.dart';
import 'package:application/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:application/features/explore/data/repository/explore_repository_impl.dart';
import 'package:application/features/explore/data/source/local/history_local.dart';
import 'package:application/features/explore/data/source/remote/filter_api.dart';
import 'package:application/features/explore/data/source/remote/genre_api.dart';
import 'package:application/features/explore/domain/repository/explore_repository.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_bloc.dart';
import 'package:application/features/explore/presentation/bloc/history/history_bloc.dart';
import 'package:application/features/explore/presentation/bloc/search/search_bloc.dart';
import 'package:application/features/profile/data/models/profile_model.dart';
import 'package:application/features/profile/data/source/local/profile_local.dart';
import 'package:application/features/profile/presentation/bloc/session/session_bloc.dart';
import 'package:application/features/slider/data/models/slider_model.dart';
import 'package:application/features/slider/data/source/local/slider_local.dart';
import 'package:application/features/template/data/repository/template_repository_impl.dart';
import 'package:application/features/template/data/source/remote/template_api.dart';
import 'package:application/features/template/domain/repository/template_repository.dart';
import 'package:application/features/template/presentation/bloc/template_bloc.dart';
import 'package:application/network/download/download_video.dart';
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
import 'package:media_kit/media_kit.dart';

final sl = GetIt.instance;
final baseOptions = BaseOptions(
  baseUrl: "$amediatvBaseUrl/api",
  headers: {
    "User-Agent": "okhttp/4.12.0",
    "Accept-Encoding": "gzip",
    "accept": "application/json",
    "Connection": "Keep-Alive",
    "x-platform": "mobile",
    "x-platform-os": "android",
    "x-device": "Redmi 6A",
    "x-app-version": "2.4.9",
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjZmYjliNzcwYzY1MjcxMGJlNTUxZjRmIiwidG9rZW5faWQiOiIzMzZkYmUxMS1iOTQ5LTQ0YjktOGE0ZC1iM2NhZDE1MzQxMTIiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNzc4MTIwMDQ2LCJleHAiOjE3NzkzMjk2NDZ9.3wvNVk-43ULYFOKpdjFXD43qatnj-9c4HNZIDLK1zy0",
  },
);
final dio = Dio(baseOptions);
final secureStorage = FlutterSecureStorage();

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup local Storage;
  MediaKit.ensureInitialized();
  final cacheDir = await getApplicationCacheDirectory();
  await Hive.initFlutter("${cacheDir.path}/boxes/");
  Hive.registerAdapters();

  // Setup miscs;
  await Utils.initFullscreen();
  await dotenv.load(fileName: '.env');
  await initializeDateFormatting('uz');

  // Open boxes;
  await Hive.deleteBoxFromDisk("cacheBox");
  final calendarBox = await Hive.openBox<CalendarModel>("calendarBox");
  final profileBox = await Hive.openBox<ProfileModel>("profileBox");
  final sliderBox = await Hive.openBox<SliderModel>("sliderBox");
  final historyBox = await Hive.openBox<AnimeModel>("historyBox");
  final timelineBox = await Hive.openBox<TimelineModel>("timelineBox");
  final downloadsBox = await Hive.openBox<DownloadTask>("downloadTaskBox");

  await Utils.closeSplashScreen();

  // Register / Setup network logic;
  sl.registerSingleton<FlutterSecureStorage>(secureStorage);
  sl.registerSingleton<AuthStorage>(AuthStorageImpl(sl()));
  sl.registerLazySingleton<ErrorInterceptor>(() => ErrorInterceptor());
  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(sl()));
  dio.interceptors.add(sl<ErrorInterceptor>());
  dio.interceptors.add(sl<AuthInterceptor>());

  // Register local storages;
  sl.registerSingleton<Box<CalendarModel>>(calendarBox);
  sl.registerSingleton<Box<AnimeModel>>(historyBox, instanceName: "history");
  sl.registerSingleton<Box<ProfileModel>>(profileBox);
  sl.registerSingleton<Box<SliderModel>>(sliderBox);
  sl.registerSingleton<Box<TimelineModel>>(timelineBox);
  sl.registerSingleton<Box<DownloadTask>>(downloadsBox);

  // Register miscs;
  sl.registerSingleton<Dio>(dio);
  sl.registerSingleton<DotEnv>(dotenv);
  sl.registerSingleton<VideoDownloader>(VideoDownloader());

  // Register remote Api Services;
  sl.registerSingleton<SliderApi>(SliderApi(sl()));
  sl.registerSingleton<CalendarApi>(CalendarApi(sl()));
  sl.registerSingleton<AuthApi>(AuthApi(sl()));
  sl.registerSingleton<ProfileApi>(ProfileApi(sl()));
  sl.registerSingleton<AnimeApi>(AnimeApi(sl()));
  sl.registerSingleton<SeasonApi>(SeasonApi(sl()));
  sl.registerSingleton<EpisodeApi>(EpisodeApi(sl()));
  sl.registerSingleton<GenreApi>(GenreApi(sl()));
  sl.registerSingleton<CommentApi>(CommentApi(sl()));
  sl.registerSingleton<VideoApi>(VideoApi(sl()));
  sl.registerSingleton<FilterApi>(FilterApi(sl()));
  sl.registerSingleton<TemplateApi>(TemplateApi(sl()));
  sl.registerSingleton<DownloadsLocal>(DownloadsLocalImpl(sl()));
  sl.registerSingleton<HlsDownloadService>(HlsDownloadService(sl()));

  // Register Local Storage Services;
  sl.registerSingleton<CalendarLocal>(CalendarLocalImpl(sl()));
  sl.registerSingleton<ProfileLocal>(ProfileLocalImpl(sl()));
  sl.registerSingleton<SliderLocal>(SliderLocalImpl(sl()));
  sl.registerSingleton<HistoryLocal>(HistoryLocalImpl(sl(instanceName: 'history')));
  sl.registerSingleton<Timeline>(TimelineImpl(sl()));

  // Register Repositories;
  sl.registerSingleton<SliderRepository>(SliderRepositoryImpl(sl(), sl()));
  sl.registerSingleton<CalendarRepository>(CalendarRepositoryImpl(sl(), sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));
  sl.registerSingleton<EpisodeRepository>(EpisodeRepositoryImpl(sl(), sl(), sl()));
  sl.registerSingleton<CommentRepository>(CommentRepositoryImpl(sl()));
  sl.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(sl(), sl(), sl()));
  sl.registerSingleton<AnimeRepository>(AnimeRepositoryImpl(sl(), sl()));
  sl.registerSingleton<SeasonRepository>(SeasonRepositoryImpl(sl()));
  sl.registerSingleton<ExploreRepository>(ExploreRepositoryImpl(sl(), sl(), sl()));
  sl.registerSingleton<TemplateRepository>(TemplateRepositoryImpl(sl()));

  // Register State managers;
  sl.registerFactory<SliderBloc>(() => SliderBloc(sl()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<CalendarBloc>(() => CalendarBloc(sl()));
  sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl()));
  sl.registerFactory<SessionBloc>(() => SessionBloc(sl()));
  sl.registerFactory<AnimeBloc>(() => AnimeBloc(sl()));
  sl.registerFactory<SeasonBloc>(() => SeasonBloc(sl()));
  sl.registerFactory<GenreBloc>(() => GenreBloc(sl()));
  sl.registerFactory<EpisodeBloc>(() => EpisodeBloc(sl(), sl()));
  sl.registerFactory<CommentBloc>(() => CommentBloc(sl()));
  sl.registerFactory<TemplateBloc>(() => TemplateBloc(sl()));
  sl.registerFactory<VideoBloc>(() => VideoBloc(sl()));
  sl.registerFactory<SearchBloc>(() => SearchBloc(sl()));
  sl.registerFactory<HistoryBloc>(() => HistoryBloc(sl()));

  sl.registerFactory<PlayerController>(() => PlayerController(sl(), sl()));
}
