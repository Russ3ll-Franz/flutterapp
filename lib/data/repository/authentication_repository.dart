import 'dart:async';

import 'package:peritosapp/data/model/auth_login.dart';
import 'package:peritosapp/data/model/user_response_entity.dart';
import 'package:peritosapp/data/network/http_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  final HttpMethodsType _httpMethod = HttpMethodsType();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<UserResponseEntity> logIn({
    required String username,
    required String password,
  }) async {
    UserLogin userLogin = UserLogin(username: username, password: password);
    final response =
        await _httpMethod.post("usuario/logInApp", userLogin.toJson());

    SharedPreferences preferences = await SharedPreferences.getInstance();
    final dataResponse = UserResponseEntity.fromJson(response);
    preferences.setString("id", dataResponse.user!.id.toString());

    _controller.add(AuthenticationStatus.authenticated);
    return dataResponse;
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
