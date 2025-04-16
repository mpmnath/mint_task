// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot_groups_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlotGroupsModel _$SlotGroupsModelFromJson(Map<String, dynamic> json) =>
    SlotGroupsModel(
      slotGroupName: json['slotGroupName'] as String,
      resources:
          (json['resources'] as List<dynamic>)
              .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SlotGroupsModelToJson(SlotGroupsModel instance) =>
    <String, dynamic>{
      'slotGroupName': instance.slotGroupName,
      'resources': instance.resources,
    };
