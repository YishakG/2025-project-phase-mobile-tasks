import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/features/auth/domain/entities/auth_entity.dart';
import 'package:shoe_interface/features/auth/domain/usecases/login_usecase.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockAuthRepository mockAuthRepository;
  late LoginUsecase loginUsecase;

  setUp((){
    mockAuthRepository = MockAuthRepository();
    loginUsecase = LoginUsecase(authRepository: mockAuthRepository);
  });
  const tname = 'test';
  const tid = 'test';
  const temail = 'test@gmail.com';
  const ttoken = 'test';
  const tpassword = 'test';

  const tUser = AuthEntity(name: tname, id: tid, email: temail, authtoken: ttoken);

  test('should login using repository',
    () async {
  
      // arrange
      when(mockAuthRepository.login(email: temail, password: tpassword)).thenAnswer((_) async =>Right(tUser));
  
      // act
      final result = await mockAuthRepository.login(email: temail, password: tpassword);
  
      // assert
      expect(result, Right(tUser));
      verify(mockAuthRepository.login(email: temail, password: tpassword)).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
  
    }
  );
}