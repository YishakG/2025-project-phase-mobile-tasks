import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class SignUpUsecase {
  AuthRepository authRepository;
  SignUpUsecase({required this.authRepository});

  

  Future<Either<Failure,AuthEntity>> execute (String name, String email, String password) {
    return authRepository.signup(name: name, email: email, password: password);
  }
}
