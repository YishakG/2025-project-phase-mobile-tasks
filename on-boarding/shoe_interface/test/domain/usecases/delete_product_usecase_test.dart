import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/domain/usecases/delete_product_usecase.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  DeleteProductUsecase deleteProductUsecase;
  late MockProductRepository mockProductRepository;
  setUp(() {
    mockProductRepository = MockProductRepository();
    deleteProductUsecase = DeleteProductUsecase(mockProductRepository);
  });

  final testId = '12345';

  test('should delete a product and return Right(void)', () async {
    // arrange
    when(
      mockProductRepository.deleteProduct(testId),
    ).thenAnswer((_) async => Right(null));

    // act
    final result = await mockProductRepository.deleteProduct(testId);

    // assert
    expect(result, const Right(null));
    verify(mockProductRepository.deleteProduct(testId)).called(1);
    verifyNoMoreInteractions(mockProductRepository);
  });
}
