import 'package:json_annotation/json_annotation.dart';
import 'package:mint/features/training/data/models/user_model.dart';
import 'package:mint/features/training/domain/entities/training.dart';

part 'slot_groups_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SlotGroupsModel {
  final String slotGroupName;
  final List<UserModel> resources;

  SlotGroupsModel({required this.slotGroupName, required this.resources});

  factory SlotGroupsModel.fromJson(Map<String, dynamic> json) =>
      _$SlotGroupsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlotGroupsModelToJson(this);

  // to entity
  SlotGroups toEntity() {
    return SlotGroups(
      slotGroupName: slotGroupName,
      resources: resources.map((e) => e.toEntity()).toList(),
    );
  }
}
