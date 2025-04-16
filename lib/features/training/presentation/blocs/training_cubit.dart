import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/core/domain/usecases/use_case.dart';
import 'package:mint/features/training/domain/entities/training.dart';
import 'package:mint/features/training/domain/usecases/get_training_usecase.dart';

part 'training_state.dart';

@singleton
class TrainingCubit extends Cubit<TrainingState> {
  final GetTrainingUseCase _getTrainingUseCase;

  TrainingCubit({required GetTrainingUseCase getTrainingUseCase})
    : _getTrainingUseCase = getTrainingUseCase,
      super(TrainingInitial());

  void getTraining() async {
    emit(TrainingLoading());
    final result = await _getTrainingUseCase(NoParams());
    result.fold(
      (failure) => emit(TrainingError(message: failure.message)),
      (training) => emit(TrainingLoaded(training: training)),
    );
  }
}
