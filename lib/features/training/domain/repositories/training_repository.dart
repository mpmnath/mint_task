import 'package:dartz/dartz.dart';
import 'package:mint/core/error/failure.dart';
import 'package:mint/features/training/domain/entities/training.dart';

abstract class TrainingRepository {
  Future<Either<Failure, Training>> getTraining();
}
