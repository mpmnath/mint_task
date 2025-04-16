import 'package:flutter/material.dart';
import 'package:mint/features/training/presentation/blocs/training_cubit.dart';

extension TrainingStateExt on TrainingState {
  Widget maybeWhen({
    required Scaffold Function() loading,
    required Scaffold Function(dynamic training) loaded,
    required Scaffold Function(dynamic message) error,
    required Scaffold Function() orElse,
  }) {
    if (this is TrainingLoading) {
      return loading();
    } else if (this is TrainingLoaded) {
      return loaded((this as TrainingLoaded).training);
    } else if (this is TrainingError) {
      return error((this as TrainingError).message);
    } else {
      return orElse();
    }
  }
}
