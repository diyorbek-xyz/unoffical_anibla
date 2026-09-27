import 'package:application/shared/utils/utils.dart';
import 'package:application/features/anibla/data/models/data/slider.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:application/features/anibla/data/models/misc/calendar.dart';
import 'package:application/features/anibla/data/repositories/profile_repository_impl.dart';
import 'package:application/features/anibla/data/source/local/profile_local.dart';
import 'package:application/features/anibla/data/source/local/saved_ids_local.dart';
import 'package:application/features/anibla/presentation/controllers/anime_controller.dart';
import 'package:application/features/anibla/presentation/controllers/saved_controller.dart';
import 'package:application/features/anibla/data/source/local/search_history_local.dart';
import 'package:application/features/anibla/presentation/controllers/explore_controller.dart';
import 'package:application/features/player/data/model/service/download_models.dart';
import 'package:application/features/player/data/model/timeline_model.dart';
import 'package:application/features/player/data/services/download_service.dart';
import 'package:application/features/player/data/source/local/downloads.dart';
import 'package:application/features/player/data/source/local/timeline.dart';
import 'package:application/features/player/presentation/cubit/player/player_controller.dart';
import 'package:application/features/anibla/data/repositories/notification_repository_impl.dart';
import 'package:application/features/anibla/data/source/network/notifications_api.dart';
import 'package:application/features/anibla/data/source/network/plans_api.dart';
import 'package:application/features/anibla/domain/repositories/notification_repository.dart';
import 'package:application/features/anibla/presentation/controllers/profile_controller.dart';
import 'package:application/features/anibla/presentation/controllers/slider_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:application/features/anibla/data/repositories/anime_repository_impl.dart';
import 'package:application/features/anibla/data/repositories/episode_repository_impl.dart';
import 'package:application/features/anibla/data/repositories/season_repository_impl.dart';
import 'package:application/features/anibla/data/source/network/anime_api.dart';
import 'package:application/features/anibla/data/source/network/episode_api.dart';
import 'package:application/features/anibla/data/source/network/season_api.dart';
import 'package:application/features/anibla/data/source/network/video_api.dart';
import 'package:application/features/anibla/domain/repositories/anime_repository.dart';
import 'package:application/features/anibla/domain/repositories/episode_repository.dart';
import 'package:application/features/anibla/domain/repositories/season_repository.dart';
import 'package:application/features/anibla/data/repositories/comment_repository_impl.dart';
import 'package:application/features/anibla/data/source/network/comment_api.dart';
import 'package:application/features/anibla/domain/repositories/comment_repository.dart';
import 'package:application/features/anibla/presentation/bloc/comment/comment_bloc.dart';
import 'package:application/features/anibla/data/repositories/explore_repository_impl.dart';
import 'package:application/features/anibla/data/source/local/history_local.dart';
import 'package:application/features/anibla/data/source/network/filter_api.dart';
import 'package:application/features/anibla/data/source/network/genre_api.dart';
import 'package:application/features/anibla/domain/repositories/explore_repository.dart';
import 'package:application/features/anibla/data/source/local/slider_local.dart';
import 'package:application/core/network/interceptors/auth_interceptor.dart';
import 'package:application/core/network/interceptors/error_interceptor.dart';
import 'package:application/features/auth/data/repository/auth_repository_impl.dart';
import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:application/features/auth/data/source/remote/auth_api.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/anibla/data/repositories/calendar_repository_impl.dart';
import 'package:application/features/anibla/data/source/local/calendar_local.dart';
import 'package:application/features/anibla/data/source/network/calendar_api.dart';
import 'package:application/features/anibla/domain/repositories/calendar_repository.dart';
import 'package:application/features/anibla/presentation/bloc/calendar/calendar_bloc.dart';
import 'package:application/features/anibla/data/source/network/profile_api.dart';
import 'package:application/features/anibla/domain/repositories/profile_repository.dart';
import 'package:application/features/anibla/data/repositories/slider_repository_impl.dart';
import 'package:application/features/anibla/data/source/network/slider_api.dart';
import 'package:application/features/anibla/domain/repositories/slider_repository.dart';
import 'package:application/hive_registrar.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:media_kit/media_kit.dart';

final sl = GetIt.instance;
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

  final baseOptions = BaseOptions(
    baseUrl: "${dotenv.env['BASE_URL']}/api",
    headers: {
      "User-Agent": "okhttp/4.12.0",
      "Accept-Encoding": "gzip",
      "accept": "application/json",
      "Connection": "Keep-Alive",
      "x-platform": "desktop",
      "x-platform-os": "arch",
      "x-device": "Arch Linux",
      "x-app-version": "2.4.9",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNmE2OWFlNzJhODA0YmNkOTZmYjY3N2M2IiwidG9rZW5faWQiOiI1NjI0MDYwNS1kOWE0LTQ4ODAtYWQ4NS0yYTJmNmQxODdjZTMiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNzkwNDM0Nzk4LCJleHAiOjE3OTE2NDQzOTh9.FaIVkst2ZuU93CrdvSc6hM2CfmUB9ISakoeHHHvVctQ",
    },
  );
  final dio = Dio(baseOptions);

  // Open boxes;
  await Hive.deleteBoxFromDisk("cacheBox");
  final calendarBox = await Hive.openBox<Calendar>("calendarBox");
  final profileBox = await Hive.openBox<Profile>("profileBox");
  final sliderBox = await Hive.openBox<Slider>("sliderBox");
  final historyBox = await Hive.openBox<Anime>("historyBox");
  final timelineBox = await Hive.openBox<TimelineModel>("timelineBox");
  final downloadsBox = await Hive.openBox<DownloadTask>("downloadTaskBox");
  final savedMediaIdBox = await Hive.openBox<String>("savedMediaIdBox");
  final searchHistory = await Hive.openBox<String>("searchHistory");

  await Utils.closeSplashScreen();

  // Register / Setup network logic;
  sl
    ..registerSingleton<FlutterSecureStorage>(secureStorage)
    ..registerSingleton<AuthStorage>(AuthStorageImpl(sl()))
    ..registerLazySingleton<ErrorInterceptor>(() => ErrorInterceptor())
    ..registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(sl()));
  dio.interceptors.add(sl<ErrorInterceptor>());
  dio.interceptors.add(sl<AuthInterceptor>());

  sl
    // Register local storages;
    ..registerSingleton<Box<Calendar>>(calendarBox)
    ..registerSingleton<Box<Anime>>(historyBox, instanceName: "history")
    ..registerSingleton<Box<String>>(savedMediaIdBox, instanceName: "saved")
    ..registerSingleton<Box<Profile>>(profileBox)
    ..registerSingleton<Box<Slider>>(sliderBox)
    ..registerSingleton<Box<TimelineModel>>(timelineBox)
    ..registerSingleton<Box<DownloadTask>>(downloadsBox)
    ..registerSingleton<Box<String>>(searchHistory)
    // Register miscs;
    ..registerSingleton<Dio>(dio)
    ..registerSingleton<DotEnv>(dotenv)
    ..registerSingleton<BaseOptions>(baseOptions)
    // Register remote Api Services;
    ..registerSingleton<SliderApi>(SliderApi(sl()))
    ..registerSingleton<CalendarApi>(CalendarApi(sl()))
    ..registerSingleton<AuthApi>(AuthApi(sl()))
    ..registerSingleton<ProfileApi>(ProfileApi(sl()))
    ..registerSingleton<AnimeApi>(AnimeApi(sl()))
    ..registerSingleton<SeasonApi>(SeasonApi(sl()))
    ..registerSingleton<EpisodeApi>(EpisodeApi(sl()))
    ..registerSingleton<GenreApi>(GenreApi(sl()))
    ..registerSingleton<CommentApi>(CommentApi(sl()))
    ..registerSingleton<VideoApi>(VideoApi(sl()))
    ..registerSingleton<FilterApi>(FilterApi(sl()))
    ..registerSingleton<DownloadsLocal>(DownloadsLocalImpl(sl()))
    ..registerSingleton<HlsDownloadService>(HlsDownloadService(sl(), sl()))
    ..registerSingleton<NotificationsApi>(NotificationsApi(sl()))
    ..registerSingleton<PlansApi>(PlansApi(sl()))
    // Register Local Storage Services;
    ..registerSingleton<CalendarLocal>(CalendarLocalImpl(sl()))
    ..registerSingleton<ProfileLocal>(ProfileLocalImpl(sl()))
    ..registerSingleton<SliderLocal>(SliderLocalImpl(sl()))
    ..registerSingleton<HistoryLocal>(HistoryLocalImpl(sl(instanceName: 'history')))
    ..registerSingleton<SavedLocal>(SavedLocalImpl(sl(instanceName: 'saved')))
    ..registerSingleton<Timeline>(TimelineImpl(sl()))
    ..registerSingleton<SearchHistoryLocal>(SearchHistoryLocalImpl(sl()))
    // Register Repositories;
    ..registerLazySingleton<SliderRepository>(() => SliderRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<CalendarRepository>(() => CalendarRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<EpisodeRepository>(() => EpisodeRepositoryImpl(sl(), sl(), sl()))
    ..registerLazySingleton<CommentRepository>(() => CommentRepositoryImpl(sl()))
    ..registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl(), sl(), sl(), sl()))
    ..registerLazySingleton<AnimeRepository>(() => AnimeRepositoryImpl(sl(), sl(), sl()))
    ..registerLazySingleton<SeasonRepository>(() => SeasonRepositoryImpl(sl()))
    ..registerLazySingleton<ExploreRepository>(() => ExploreRepositoryImpl(sl(), sl(), sl()))
    ..registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImpl(sl()))
    // Register State managers;
    ..registerFactory<AuthBloc>(() => AuthBloc(sl()))
    ..registerFactory<CalendarBloc>(() => CalendarBloc(sl()))
    ..registerFactory<CommentBloc>(() => CommentBloc(sl()))
    ..registerFactory<PlayerController>(() => PlayerController(sl(), sl()))
    // Register Signal controllers;
    ..registerLazySingleton<ProfileController>(() => ProfileController(sl(), sl()))
    ..registerLazySingleton<LocalAnimesController>(() => LocalAnimesController(sl(), sl(), sl()))
    ..registerLazySingleton<AnimeController>(() => AnimeController(sl(), sl(), sl()))
    ..registerLazySingleton<ExploreController>(() => ExploreController(sl(), sl()))
    ..registerLazySingleton<SliderController>(() => SliderController(sl()));
}
