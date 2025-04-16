part of 'training_cubit.dart';

abstract class TrainingState {
  const TrainingState();
}

class TrainingInitial extends TrainingState {
  const TrainingInitial();
}

class TrainingLoading extends TrainingState {
  const TrainingLoading();
}

class TrainingLoaded extends TrainingState {
  final Training training;

  const TrainingLoaded({required this.training});
}

class TrainingError extends TrainingState {
  final String message;

  const TrainingError({required this.message});
}
