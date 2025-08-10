import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/features/auth/domain/usecases/logout_usecase.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockAuthRepository mockAuthRepository;
  LogoutUsecase logoutUsecase;

  setUp((){
    mockAuthRepository = MockAuthRepository();
    logoutUsecase = LogoutUsecase(authRepository: mockAuthRepository);
  });
  
  test('should logout using the repository',
    () async {
  
      // arrange
      when(mockAuthRepository.logout()).thenAnswer((_) async => const Right(unit));
  
      // act
      final result = await mockAuthRepository.logout();
  
      // assert
      expect(result, const Right(unit));
      verify(mockAuthRepository.logout()).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    }
  );
}