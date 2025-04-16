// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingModel _$TrainingModelFromJson(Map<String, dynamic> json) =>
    TrainingModel(
      categoryName: json['categoryName'] as String,
      eventName: json['eventName'] as String,
      slotGroups:
          (json['slotGroups'] as List<dynamic>)
              .map((e) => SlotGroupsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$TrainingModelToJson(TrainingModel instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'eventName': instance.eventName,
      'slotGroups': instance.slotGroups,
    };
