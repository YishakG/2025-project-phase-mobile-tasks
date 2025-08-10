import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class LogoutUsecase {
  AuthRepository authRepository;
  LogoutUsecase({required this.authRepository});
  Future<Either<Failure,Unit>> execute() {
    return authRepository.logout();
  }
}