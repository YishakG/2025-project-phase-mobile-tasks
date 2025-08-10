import '../../domain/entities/auth_entity.dart';

class AuthModels extends AuthEntity {
  const AuthModels({
    required super.name,
    required super.id,
    required super.email,
    required super.authtoken,
  });

  factory AuthModels.fromJson(Map<String, dynamic> json) => AuthModels(
    name: json['name'],
    id: json['id'],
    email: json['email'],
    authtoken: json['token'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email':email,
    'token': authtoken
  };
}
