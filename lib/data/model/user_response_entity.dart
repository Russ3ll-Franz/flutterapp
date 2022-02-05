import 'dart:convert';
import 'package:peritosapp/data/model/user_entity.dart';
import 'package:peritosapp/generated/json/base/json_field.dart';
import 'package:peritosapp/generated/json/user_response_entity.g.dart';

@JsonSerializable()
class UserResponseEntity {
  bool? status;
  String? message;
  UserEntity? user;
  UserResponseEntity();

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      $UserResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
