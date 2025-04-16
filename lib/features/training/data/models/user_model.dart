import 'package:json_annotation/json_annotation.dart';
import 'package:mint/features/training/domain/entities/training.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class UserModel {
  final String firstName;
  final String name;
  final String userId;
  final String photo;
  List<String> certificates;

  UserModel({
    required this.firstName,
    required this.name,
    required this.userId,
    required this.photo,
    required this.certificates,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // to entity
  User toEntity() {
    return User(
      firstName: firstName,
      name: name,
      userId: userId,
      photo: photo,
      certificates: certificates,
    );
  }
}
