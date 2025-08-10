import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String authtoken
  ;

  const AuthEntity({
    required this.name,
    required this.id,
    required this.email,
    required this.authtoken
    ,
  });
  @override
  List<Object> get props => [id, name, email, authtoken
  ];
}
