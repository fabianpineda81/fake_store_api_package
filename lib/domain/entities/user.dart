import 'package:api_connections_package/core/contracts/entity.dart';

class User implements Entity {
  final int id;
  final String username;
  final String password;
  final String phone;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.phone,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
    );
  }
  @override
  Map<String, dynamic> toJson() => {
    'id':id,
    'username':username,
    'password':password,
    'phone':phone,
  };
}
