import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/core/domain/usecases/use_case.dart';
import 'package:mint/core/error/failure.dart';
import 'package:mint/features/training/domain/entities/training.dart';
import 'package:mint/features/training/domain/repositories/training_repository.dart';

@lazySingleton
class GetTrainingUseCase implements UseCase<Training, NoParams> {
  final TrainingRepository repository;
  const GetTrainingUseCase(this.repository);

  @override
  Future<Either<Failure, Training>> call(NoParams params) async {
    return await repository.getTraining();
  }
}
