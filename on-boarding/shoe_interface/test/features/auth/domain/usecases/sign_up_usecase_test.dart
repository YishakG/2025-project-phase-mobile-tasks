import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/features/auth/domain/entities/auth_entity.dart';
import 'package:shoe_interface/features/auth/domain/usecases/sign_up_usecase.dart';

import '../../../../helpers/test_helper.mocks.dart';



void main (){
  late MockAuthRepository mockAuthRepository;
  late SignUpUsecase signUpUsecase;
  setUp((){
    mockAuthRepository = MockAuthRepository();
    signUpUsecase = SignUpUsecase(authRepository: mockAuthRepository);
  });
  const tUser = AuthEntity(name: "test", id: '1', email: 'test@gmail.com', authtoken: 'token');

  test('should sigup user using the repository', () async {
    // arrange
    when(mockAuthRepository.signup(name: 'test', email: 'test@gmail.com', password: 'test')).thenAnswer((_) async => const Right(tUser));
    // act
    final result = await mockAuthRepository.signup(name: tUser.name, email: tUser.email, password: 'test');
    // assert
    expect(result, Right(tUser));
    verify(mockAuthRepository.signup(name: tUser.name, email: tUser.email, password: 'test')).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}