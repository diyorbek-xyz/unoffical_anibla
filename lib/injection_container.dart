import 'package:application/core/constants/constants.dart';
import 'package:application/data/repositories/anime_repository_impl.dart';
import 'package:application/data/repositories/episode_repository_impl.dart';
import 'package:application/data/repositories/season_repository_impl.dart';
import 'package:application/data/sources/remote/anime_api_service.dart';
import 'package:application/data/sources/remote/episode_api_service.dart';
import 'package:application/data/sources/remote/season_api_service.dart';
import 'package:application/data/sources/remote/video_api_service.dart';
import 'package:application/domain/repositories/anime_repository.dart';
import 'package:application/domain/repositories/episode_repository.dart';
import 'package:application/domain/repositories/season_repository.dart';
import 'package:application/domain/usecases/anime_usecase.dart';
import 'package:application/domain/usecases/episode_usecase.dart';
import 'package:application/domain/usecases/season_usecase.dart';
import 'package:application/domain/usecases/video_usecase.dart';
import 'package:application/hive_registrar.g.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_bloc.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_bloc.dart';
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
    sendTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
    connectTimeout: Duration(seconds: 10),
    baseUrl: "$amediatvBaseUrl/api",
    headers: {"Content-Type": Headers.contentTypeHeader, "Accept": Headers.acceptHeader, "User-Agent": "Mozilla/5.0"},
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

  sl.registerSingleton<AnimeRepository>(AnimeRepositoryImpl(sl()));
  sl.registerSingleton<SeasonRepository>(SeasonRepositoryImpl(sl()));
  sl.registerSingleton<EpisodeRepository>(EpisodeRepositoryImpl(sl(), sl()));

  sl.registerSingleton<GetAnimesUseCase>(GetAnimesUseCase(sl()));
  sl.registerSingleton<GetSeasonBySlugUseCase>(GetSeasonBySlugUseCase(sl()));
  sl.registerSingleton<GetSeasonsUseCase>(GetSeasonsUseCase(sl()));
  sl.registerSingleton<GetEpisodesUseCase>(GetEpisodesUseCase(sl()));
  sl.registerSingleton<GetVideoUsecase>(GetVideoUsecase(sl()));

  sl.registerFactory<RemoteAnimeBloc>(() => RemoteAnimeBloc(sl()));
  sl.registerFactory<RemoteEpisodeBloc>(() => RemoteEpisodeBloc(sl()));
  sl.registerFactory<RemoteSeasonBloc>(() => RemoteSeasonBloc(sl(), sl()));
  sl.registerFactory<RemoteVideoBloc>(() => RemoteVideoBloc(sl()));
}
