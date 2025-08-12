import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/features/product/domain/entities/product_entitiy.dart';
import 'package:shoe_interface/features/product/domain/usecases/view_all_products_usecase.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main(){
  ViewAllProductsUsecase viewAllProductsUsecase;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    viewAllProductsUsecase = ViewAllProductsUsecase(mockProductRepository);
  });
  List<ProductEntitiy> testListOfProduct = [
    ProductEntitiy(id: '12345', name: '"Nike SB Dunk Low Panda"', description: 'Classic Panda colorway, leather upper, waffle outsole', imageUrl: 'https://.../images/12345.jpg', price: 100.0),
    ProductEntitiy(id: '12345', name: '"Nike SB Dunk Low Panda"', description: 'Classic Panda colorway, leather upper, waffle outsole', imageUrl: 'https://.../images/12345.jpg', price: 100.0),
  ];
  test('should return list of Product Entities from the Repositroy',
    () async {
  
      // arrange
      when(mockProductRepository.viewAllProducts()).thenAnswer((_) async => Right(testListOfProduct));
      // act
      final result = await mockProductRepository.viewAllProducts();
      // assert
      expect(result, Right(testListOfProduct));
      verify(mockProductRepository.viewAllProducts()).called(1);
      verifyNoMoreInteractions(mockProductRepository);
    }
  );
}