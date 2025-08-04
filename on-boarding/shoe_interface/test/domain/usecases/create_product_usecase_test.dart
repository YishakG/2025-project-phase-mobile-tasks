import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/features/product/domain/entities/product_entitiy.dart';
import 'package:shoe_interface/features/product/domain/usecases/create_product_usecase.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  CreateProductUsecase createProductUsecase;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    createProductUsecase = CreateProductUsecase(mockProductRepository);
  });

  final testProduct = const ProductEntitiy(id: '12345', name: '"Nike SB Dunk Low Panda"', description: 'Classic Panda colorway, leather upper, waffle outsole', imageUrl: 'https://.../images/12345.jpg', price: 100.0);

  test('should return a create product',
    () async {
  
      // arrange
      when(mockProductRepository.createProduct(testProduct)).thenAnswer((_) async => Right(testProduct));
  
      // act
      final result = await mockProductRepository.createProduct(testProduct);
  
      // assert
      expect(result,  Right(testProduct));
      verify(mockProductRepository.createProduct(testProduct)).called(1);
      verifyNoMoreInteractions(mockProductRepository);
  
    }
  );
}