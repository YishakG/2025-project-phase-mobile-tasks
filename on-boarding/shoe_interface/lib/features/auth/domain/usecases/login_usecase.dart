import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUsecase {
  AuthRepository authRepository;
  LoginUsecase({required this.authRepository});

  Future<Either<Failure,AuthEntity>> execute(String email, String password){
    return authRepository.login(email: email, password: password);
  }

}