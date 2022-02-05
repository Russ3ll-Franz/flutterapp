
import 'package:meta/meta.dart';
import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    @required this.username,
    @required this.password,
  });

  final String? username;
  final String? password;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}
