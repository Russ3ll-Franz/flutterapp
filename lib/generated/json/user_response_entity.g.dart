import 'package:peritosapp/data/model/user_entity.dart';
import 'package:peritosapp/data/model/user_response_entity.dart';
import 'package:peritosapp/generated/json/base/json_convert_content.dart';

UserResponseEntity $UserResponseEntityFromJson(Map<String, dynamic> json) {
  final UserResponseEntity userResponseEntity = UserResponseEntity();
  final bool? status = jsonConvert.convert<bool>(json['status']);
  if (status != null) {
    userResponseEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userResponseEntity.message = message;
  }
  final UserEntity? user = jsonConvert.convert<UserEntity>(json['user']);
  if (user != null) {
    userResponseEntity.user = user;
  }
  return userResponseEntity;
}

Map<String, dynamic> $UserResponseEntityToJson(UserResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['user'] = entity.user?.toJson();
  return data;
}
