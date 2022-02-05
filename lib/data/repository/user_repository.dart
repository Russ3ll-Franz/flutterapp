import 'package:peritosapp/data/model/user_entity.dart';
import 'package:peritosapp/data/network/http_methods.dart';

class UserRepository {
  final HttpMethodsType _helper = HttpMethodsType();
  UserEntity? _user;

  Future<UserEntity> getUserById(userID) async {
    final userList = await _helper.get("usuario/getUserID/$userID");

    return UserEntity.fromJson(userList);
  }

  Future<UserEntity?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = UserEntity(id: "100", fullName: "Carlos"),
    );
  }
}
