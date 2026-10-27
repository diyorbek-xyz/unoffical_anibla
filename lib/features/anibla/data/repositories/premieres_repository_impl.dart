import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/data/models/misc/premieres.dart';
import 'package:application/features/anibla/data/source/local/premieres_local.dart';
import 'package:application/features/anibla/data/source/network/premieres_api.dart';
import 'package:application/features/anibla/domain/repositories/premieres_repository.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PremieresRepositoryImpl implements PremieresRepository {
  final PremieresApi calendarApi;
  final PremieresLocal calendarLocal;
  const PremieresRepositoryImpl(this.calendarApi, this.calendarLocal);

  @override
  Future<Either<Failure, Premieres>> getPremieres(DateTime date) async {
    try {
      try {
        final httpResponse = await calendarApi.getPremieres(date.formatCompact());
        final model = Premieres.fromJson(httpResponse.data.data).copyWith(date: date.toString());
        await calendarLocal.savePremieres(model);
        return Right(model);
      } on DioException catch (e) {
        final failure = ExceptionMapper.mapDioToFailure(e);
        if (failure is NetworkFailure) {
          final local = await calendarLocal.getPremieres(date);
          if (local != null) return Right(local);
        }
        rethrow;
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
