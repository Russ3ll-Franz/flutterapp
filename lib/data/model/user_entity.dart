import 'dart:convert';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String fullName;

  const UserEntity({required this.id, required this.fullName});

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
      };

  static const empty = UserEntity(
    id: '',
    fullName: '',
  );

  @override
  List<Object?> get props => [id];
}
