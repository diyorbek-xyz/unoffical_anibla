import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/core/network/clients/mano_client.dart';
import 'package:application/core/network/clients/neutral_client.dart';
import 'package:application/core/network/interceptors/mano_interceptor.dart';
import 'package:application/features/anibla/data/models/main/anibla_profile.dart';
import 'package:application/features/anibla/presentation/controllers/comment_controller.dart';
import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:application/features/mano/data/repository/book_repository_impl.dart';
import 'package:application/features/mano/data/source/local/books_local.dart';
import 'package:application/features/mano/data/source/network/books_api.dart';
import 'package:application/features/mano/data/source/network/mano_profile_api.dart';
import 'package:application/features/auth/data/source/remote/mano_auth_api.dart';
import 'package:application/features/mano/domain/repository/book_repository.dart';
import 'package:application/features/mano/presentation/controllers/book_controller.dart';
import 'package:application/features/player/presentation/controller/player_controller.dart';
import 'package:application/shared/utils/utils.dart';
import 'package:application/features/anibla/data/models/data/carousel_item.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/misc/calendar.dart';
import 'package:application/features/anibla/data/repositories/profile_repository_impl.dart';
import 'package:application/features/anibla/data/source/local/profile_local.dart';
import 'package:application/features/anibla/data/source/local/saved_ids_local.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/features/anibla/presentation/controllers/saved_controller.dart';
import 'package:application/features/anibla/data/source/local/search_history_local.dart';
import 'package:application/features/anibla/presentation/controllers/explore_controller.dart';
import 'package:application/features/player/data/model/service/download_models.dart';
import 'package:application/features/player/data/model/timeline_model.dart';
import 'package:application/features/player/data/services/download_service.dart';
import 'package:application/features/player/data/source/local/downloads.dart';
import 'package:application/features/player/data/source/local/timeline.dart';
import 'package:application/features/anibla/data/repositories/notification_repository_impl.dart';
import 'package:application/features/anibla/data/source/network/notifications_api.dart';
import 'package:application/features/anibla/data/source/network/plans_api.dart';
import 'package:application/features/anibla/domain/repositories/notification_repository.dart';
import 'package:application/features/anibla/presentation/controllers/profile_controller.dart';
import 'package:application/features/anibla/presentation/controllers/slider_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_video_caching/flutter_video_caching.dart' as video_caching;
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
import 'package:application/features/anibla/data/source/network/explore_api.dart';
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
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:media_kit/media_kit.dart';

final sl = GetIt.instance;

Future<void> setupHive() async {
  final cacheDir = await getApplicationCacheDirectory();
  await Hive.initFlutter("${cacheDir.path}/boxes/");
  Hive.registerAdapters();
  await Hive.deleteBoxFromDisk("cacheBox");
}

Future<void> setupMiscs() async {
  MediaKit.ensureInitialized();
  await video_caching.VideoProxy.init();
  await Utils.initFullscreen();
  await dotenv.load(fileName: '.env');
  await initializeDateFormatting('uz');
}

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupHive();
  await setupMiscs();

  // Open boxes;
  final calendarBox = await Hive.openBox<Calendar>("calendarBox");
  final profileBox = await Hive.openBox<AniblaProfile>("profileBox");
  final sliderBox = await Hive.openBox<CarouselItem>("sliderBox");
  final historyBox = await Hive.openBox<Anime>("historyBox");
  final timelineBox = await Hive.openBox<TimelineModel>("timelineBox");
  final downloadsBox = await Hive.openBox<DownloadTask>("downloadTaskBox");
  final savedMediaIdBox = await Hive.openBox<String>("savedMediaIdBox");
  final searchHistory = await Hive.openBox<String>("searchHistory");
  final mangasBox = await Hive.openBox<Manga>("mangasBox");

  await Utils.closeSplashScreen();

  // Register / Setup network logic;
  sl
    ..registerSingleton<FlutterSecureStorage>(FlutterSecureStorage())
    ..registerSingleton<AuthStorage>(AuthStorageImpl(sl()));

  final errorInterceptor = ErrorInterceptor();
  final neutralClient = NeutralClient()..interceptors.add(errorInterceptor);
  sl.registerSingleton<NeutralClient>(neutralClient);

  final authInterceptor = AuthInterceptor();
  final manoInterceptor = ManoInterceptor(sl(), sl());
  final aniblaClient = AniblaClient();
  final manoClient = ManoClient();
  aniblaClient.interceptors.addAll([errorInterceptor, authInterceptor]);
  manoClient.interceptors.addAll([errorInterceptor, manoInterceptor]);

  sl
    // Register local storages;
    ..registerSingleton<Box<Calendar>>(calendarBox)
    ..registerSingleton<Box<Anime>>(historyBox, instanceName: "history")
    ..registerSingleton<Box<String>>(savedMediaIdBox, instanceName: "saved")
    ..registerSingleton<Box<AniblaProfile>>(profileBox)
    ..registerSingleton<Box<CarouselItem>>(sliderBox)
    ..registerSingleton<Box<TimelineModel>>(timelineBox)
    ..registerSingleton<Box<DownloadTask>>(downloadsBox)
    ..registerSingleton<Box<String>>(searchHistory)
    ..registerSingleton<Box<Manga>>(mangasBox)
    // Register miscs;
    ..registerSingleton<AniblaClient>(aniblaClient)
    ..registerSingleton<ManoClient>(manoClient)
    ..registerSingleton<DotEnv>(dotenv)
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
    ..registerSingleton<AniblaExploreApi>(AniblaExploreApi(sl()))
    ..registerSingleton<DownloadsLocal>(DownloadsLocalImpl(sl()))
    ..registerSingleton<HlsDownloadService>(HlsDownloadService(sl(), sl()))
    ..registerSingleton<NotificationsApi>(NotificationsApi(sl()))
    ..registerSingleton<PlansApi>(PlansApi(sl()))
    ..registerSingleton<ManoProfileApi>(ManoProfileApi(sl()))
    ..registerSingleton<ManoAuthApi>(ManoAuthApi(sl()))
    ..registerSingleton<BooksApi>(BooksApi(sl()))
    // Register Local Storage Services;
    ..registerSingleton<CalendarLocal>(CalendarLocalImpl(sl()))
    ..registerSingleton<ProfileLocal>(ProfileLocalImpl(sl()))
    ..registerSingleton<SliderLocal>(SliderLocalImpl(sl()))
    ..registerSingleton<HistoryLocal>(HistoryLocalImpl(sl(instanceName: 'history')))
    ..registerSingleton<SavedLocal>(SavedLocalImpl(sl(instanceName: 'saved')))
    ..registerSingleton<Timeline>(TimelineImpl(sl()))
    ..registerSingleton<SearchHistoryLocal>(SearchHistoryLocalImpl(sl()))
    ..registerSingleton<BooksLocal>(BooksLocalImpl(sl()))
    // Register Repositories;
    ..registerLazySingleton<SliderRepository>(() => SliderRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<CalendarRepository>(() => CalendarRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl(), sl()))
    ..registerLazySingleton<EpisodeRepository>(() => EpisodeRepositoryImpl(sl(), sl(), sl()))
    ..registerLazySingleton<CommentRepository>(() => CommentRepositoryImpl(sl()))
    ..registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl(), sl(), sl(), sl(), sl()))
    ..registerLazySingleton<AnimeRepository>(() => AnimeRepositoryImpl(sl(), sl(), sl()))
    ..registerLazySingleton<SeasonRepository>(() => SeasonRepositoryImpl(sl()))
    ..registerLazySingleton<ExploreRepository>(() => ExploreRepositoryImpl(sl(), sl(), sl()))
    ..registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImpl(sl()))
    ..registerLazySingleton<BookRepository>(() => BookRepositoryImpl(sl(), sl()))
    // Register State managers;
    ..registerFactory<AuthBloc>(() => AuthBloc(sl()))
    ..registerFactory<CalendarBloc>(() => CalendarBloc(sl()))
    ..registerFactory<CommentBloc>(() => CommentBloc(sl()))
    // Register Signal controllers;
    ..registerLazySingleton<ProfileController>(() => ProfileController(sl(), sl(), sl()))
    ..registerLazySingleton<LocalAnimesController>(() => LocalAnimesController(sl(), sl(), sl()))
    ..registerLazySingleton<CommentController>(() => CommentController(sl(), sl()))
    ..registerLazySingleton<MediaController>(() => MediaController(sl(), sl(), sl()))
    ..registerLazySingleton<ExploreController>(() => ExploreController(sl(), sl()))
    ..registerLazySingleton<SliderController>(() => SliderController(sl()))
    ..registerLazySingleton<BookController>(() => BookController(sl()))
    ..registerLazySingleton<PlayerController>(() => PlayerController(sl(), sl()));
}
