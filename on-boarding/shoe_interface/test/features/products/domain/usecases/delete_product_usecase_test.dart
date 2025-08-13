import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  setUp(() {
    mockProductRepository = MockProductRepository();
  });

  final testId = '12345';

  test('should delete a product and return Right(void)', () async {
    // arrange
    when(
      mockProductRepository.deleteProduct(testId),
    ).thenAnswer((_) async => const Right(unit));
    // act
    final result = await mockProductRepository.deleteProduct(testId);

    // assert
    expect(result, const Right(unit));
    verify(mockProductRepository.deleteProduct(testId)).called(1);
    verifyNoMoreInteractions(mockProductRepository);
  });
}
