import 'package:peritosapp/data/model/user_entity.dart';
import 'package:peritosapp/data/network/http_methods.dart';

class UserRepository {
  final HttpMethodsType _helper = HttpMethodsType();

  late UserEntity _user;

  Future<UserEntity> getUsers(userID) async {
    if (_user != null) return _user;

    final userList = await _helper.get("usuario/getUserID/$userID");

    return UserEntity.fromJson(userList);
  }

}
