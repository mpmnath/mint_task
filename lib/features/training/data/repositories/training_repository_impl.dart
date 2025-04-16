import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/core/app_core.dart';
import 'package:mint/features/training/data/datasources/local/training_local_datasource.dart';
import 'package:mint/features/training/domain/entities/training.dart';
import 'package:mint/features/training/domain/repositories/training_repository.dart';

@LazySingleton(as: TrainingRepository)
class TrainingRepositoryImpl implements TrainingRepository {
  final TrainingDataSource _dataSource;

  TrainingRepositoryImpl({required TrainingDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<Either<Failure, Training>> getTraining() async {
    try {
      final training = await _dataSource.getTraining();
      return Right(training.toEntity());
    } catch (e) {
      return Left(ReadDatabaseFailure(message: e.toString()));
    }
  }
}
