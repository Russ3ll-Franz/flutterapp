import 'dart:convert';
import 'package:peritosapp/data/model/user_entity.dart';

import 'package:meta/meta.dart';

UserResponseEntity userResponseFromJson(String str) =>
    UserResponseEntity.fromJson(json.decode(str));

String userResponseToJson(UserResponseEntity data) =>
    json.encode(data.toJson());

class UserResponseEntity {
  final bool status;
  final String message;
  final UserEntity user;

  UserResponseEntity({
    required this.status,
    required this.message,
    required this.user,
  });

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserResponseEntity(
        status: json["status"],
        message: json["message"],
        user: UserEntity.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() =>
      {"status": status, "message": message, "user": user.toJson()};
}
