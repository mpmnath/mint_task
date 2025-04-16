import 'package:json_annotation/json_annotation.dart';
import 'package:mint/features/training/data/models/slot_groups_model.dart';
import 'package:mint/features/training/domain/entities/training.dart';

part 'training_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class TrainingModel {
  final String categoryName;
  final String eventName;
  final List<SlotGroupsModel> slotGroups;

  TrainingModel({
    required this.categoryName,
    required this.eventName,
    required this.slotGroups,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingModelToJson(this);

  // to entity
  Training toEntity() {
    return Training(
      categoryName: categoryName,
      eventName: eventName,
      slotGroups: slotGroups.map((e) => e.toEntity()).toList(),
    );
  }
}
