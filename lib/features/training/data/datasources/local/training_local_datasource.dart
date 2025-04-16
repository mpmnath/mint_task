import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/features/training/data/models/training_model.dart';

abstract class TrainingDataSource {
  // This class will get the data from the local data source
  // and return it as a list of TrainingModel
  Future<TrainingModel> getTraining();
}

@LazySingleton(as: TrainingDataSource)
class TrainingLocalDatasource implements TrainingDataSource {
  // This class will get local data from the assets folder
  // and return it as a list of TrainingModel

  @override
  Future<TrainingModel> getTraining() async {
    // Simulate a delay
    await Future.delayed(const Duration(seconds: 1));

    // Load the JSON file from the assets folder
    final String response = await rootBundle.loadString(
      'assets/data/data.json',
    );

    // Decode the JSON file and return it as a TrainingModel
    return TrainingModel.fromJson(json.decode(response));
  }
}
