import 'package:application/core/constants/constants.dart';
import 'package:application/data/repositories/anime_repository_impl.dart';
import 'package:application/data/repositories/auth/auth_repository_impl.dart';
import 'package:application/data/repositories/calendar_repository_impl.dart';
import 'package:application/data/repositories/carousel_repository_impl.dart';
import 'package:application/data/repositories/category_repository_impl.dart';
import 'package:application/data/repositories/episode_repository_impl.dart';
import 'package:application/data/repositories/season_repository_impl.dart';
import 'package:application/data/sources/remote/anime_api_service.dart';
import 'package:application/data/sources/remote/auth/auth_api_service.dart';
import 'package:application/data/sources/remote/calendar_api_service.dart';
import 'package:application/data/sources/remote/carousel_api_service.dart';
import 'package:application/data/sources/remote/category_api_service.dart';
import 'package:application/data/sources/remote/episode_api_service.dart';
import 'package:application/data/sources/remote/season_api_service.dart';
import 'package:application/data/sources/remote/video_api_service.dart';
import 'package:application/domain/repositories/anime_repository.dart';
import 'package:application/domain/repositories/auth/auth_repository.dart';
import 'package:application/domain/repositories/calendar_repository.dart';
import 'package:application/domain/repositories/carousel_repository.dart';
import 'package:application/domain/repositories/category_repository.dart';
import 'package:application/domain/repositories/episode_repository.dart';
import 'package:application/domain/repositories/season_repository.dart';
import 'package:application/domain/usecases/anime_usecase.dart';
import 'package:application/domain/usecases/auth/login_usecase.dart';
import 'package:application/domain/usecases/auth/verify_usecase.dart';
import 'package:application/domain/usecases/calendar_usecase.dart';
import 'package:application/domain/usecases/carousel_usecase.dart';
import 'package:application/domain/usecases/category_usecase.dart';
import 'package:application/domain/usecases/episode_usecase.dart';
import 'package:application/domain/usecases/search_usecase.dart';
import 'package:application/domain/usecases/season_usecase.dart';
import 'package:application/domain/usecases/video_usecase.dart';
import 'package:application/hive_registrar.g.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_bloc.dart';
import 'package:application/presentation/bloc/auth/auth_bloc.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_bloc.dart';
import 'package:application/presentation/bloc/carousel/remote/remote_carousel_bloc.dart';
import 'package:application/presentation/bloc/category/category_bloc.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_bloc.dart';
import 'package:application/presentation/bloc/search/search_bloc.dart';
import 'package:application/presentation/bloc/season/remote/remote_season_bloc.dart';
import 'package:application/presentation/bloc/video/remote/remote_video_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:media_kit/media_kit.dart';

final sl = GetIt.instance;
final dio = Dio(
  BaseOptions(
    baseUrl: "$amediatvBaseUrl/api",
    extra: {"Requester-message": "Nima gap."},
    headers: {
      "User-Agent": "okhttp/4.12.0",
      "x-platform": "mobile",
      "Accept-Encoding": "gzip",
      "accept": "application/json",
      "x-platform-os": "android",
      "Host": "amediatv.up-it.uz",
      "x-device": "Redmi 6A",
      "Connection": "Keep-Alive",
      "x-app-version": "2.4.9",
    },
  ),
);

Future<void> initializeDependencies() async {
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  MediaKit.ensureInitialized();
  Hive.registerAdapters();
  await initializeDateFormatting('uz');

  sl.registerSingleton<Dio>(dio);
  sl.registerSingleton<DotEnv>(dotenv);

  sl.registerSingleton<AnimeApiService>(AnimeApiService(sl()));
  sl.registerSingleton<SeasonApiService>(SeasonApiService(sl()));
  sl.registerSingleton<EpisodeApiService>(EpisodeApiService(sl()));
  sl.registerSingleton<VideoApiService>(VideoApiService(sl()));
  sl.registerSingleton<CalendarApiService>(CalendarApiService(sl()));
  sl.registerSingleton<CarouselApiService>(CarouselApiService(sl()));
  sl.registerSingleton<CategoryApiService>(CategoryApiService(sl()));
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));

  sl.registerSingleton<AnimeRepository>(AnimeRepositoryImpl(sl()));
  sl.registerSingleton<SeasonRepository>(SeasonRepositoryImpl(sl()));
  sl.registerSingleton<EpisodeRepository>(EpisodeRepositoryImpl(sl(), sl()));
  sl.registerSingleton<CalendarRepository>(CalendarRepositoryImpl(sl()));
  sl.registerSingleton<CarouselRepository>(CarouselRepositoryImpl(sl()));
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));

  sl.registerSingleton<GetAnimesListUseCase>(GetAnimesListUseCase(sl()));
  sl.registerSingleton<GetAnimeDetailsUseCase>(GetAnimeDetailsUseCase(sl()));
  sl.registerSingleton<GetSeasonsListUseCase>(GetSeasonsListUseCase(sl()));
  sl.registerSingleton<GetSeasonDetailsUseCase>(GetSeasonDetailsUseCase(sl()));
  sl.registerSingleton<GetEpisodesListUseCase>(GetEpisodesListUseCase(sl()));
  sl.registerSingleton<GetEpisodeDetailsUseCase>(GetEpisodeDetailsUseCase(sl()));
  sl.registerSingleton<GetVideoUsecase>(GetVideoUsecase(sl()));
  sl.registerSingleton<GetCalendarUsecase>(GetCalendarUsecase(sl()));
  sl.registerSingleton<GetCarouselItemsUsecase>(GetCarouselItemsUsecase(sl()));
  sl.registerSingleton<GetCategoriesListUsecase>(GetCategoriesListUsecase(sl()));
  sl.registerSingleton<SearchAnimesUsecase>(SearchAnimesUsecase(sl()));
  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerSingleton<VerifyUsecase>(VerifyUsecase(sl()));

  sl.registerFactory<SearchBloc>(() => SearchBloc(sl()));
  sl.registerFactory<CategoriesListBloc>(() => CategoriesListBloc(sl()));
  sl.registerFactory<RemoteAnimesListBloc>(() => RemoteAnimesListBloc(sl()));
  sl.registerFactory<RemoteAnimeDetailsBloc>(() => RemoteAnimeDetailsBloc(sl()));
  sl.registerFactory<RemoteEpisodesListBloc>(() => RemoteEpisodesListBloc(sl()));
  sl.registerFactory<RemoteEpisodeDetailsBloc>(() => RemoteEpisodeDetailsBloc(sl()));
  sl.registerFactory<RemoteSeasonsListBloc>(() => RemoteSeasonsListBloc(sl()));
  sl.registerFactory<RemoteSeasonDetailsBloc>(() => RemoteSeasonDetailsBloc(sl()));
  sl.registerFactory<RemoteVideoBloc>(() => RemoteVideoBloc(sl()));
  sl.registerFactory<RemoteCalendarBloc>(() => RemoteCalendarBloc(sl()));
  sl.registerFactory<RemoteCarouselBloc>(() => RemoteCarouselBloc(sl()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl()));
}
