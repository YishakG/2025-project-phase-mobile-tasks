import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/features/product/domain/entities/product_entitiy.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
  });

  const testProductEntity = ProductEntitiy(
    id: '12345',
    name: '"Nike SB Dunk Low Panda"',
    description: 'Classic Panda colorway, leather upper, waffle outsole',
    imageUrl: 'https://.../images/12345.jpg',
    price: 100.0,
  );
  const testId = '12345';
  test('should get a product by its id from the repository', () async {
    // arrange
    when(
      mockProductRepository.getProductById(testId),
    ).thenAnswer((_) async => const Right(testProductEntity));
    // act
    final result = await mockProductRepository.getProductById(testId);
    // assert
    // result equals test entity
    expect(result, const Right(testProductEntity));
    verify(mockProductRepository.getProductById(testId)).called(1);
    verifyNoMoreInteractions(mockProductRepository);
  });
}
