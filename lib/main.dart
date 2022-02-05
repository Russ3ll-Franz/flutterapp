import 'package:flutter/material.dart';
import 'package:peritosapp/app.dart';
import 'package:peritosapp/data/repository/user_repository.dart';
import 'data/repository/authentication_repository.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
