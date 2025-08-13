import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/core/error/exceptions.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_local_data_source.dart';
import 'package:shoe_interface/features/product/data/models/product_model.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late ProductLocalDataSourceImpl productLocalDataSourceImpl;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    productLocalDataSourceImpl = ProductLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  const tProductId1 = '12345';
  const tProdcutId2 = '6789';

  const tProduct1 = ProductModel(
    id: tProductId1,
    name: 'Nike SB Dunk Low Panda',
    description: 'Classic Panda colorway, leather upper, waffle outsole',
    imageUrl: 'https://.../images/12345.jpg',
    price: 100.0,
  );
  const tProdcut2 = ProductModel(
    id: tProdcutId2,
    name: 'Nike Air',
    description: 'fancy shoes',
    imageUrl: 'nike.com/2b',
    price: 130.0,
  );
  const tProducts = [tProduct1, tProdcut2];
  final tProduct1Json = jsonEncode(
    jsonDecode(readJson('helpers/dummy_data/dummy_product_response.json')),
  );
  final productsListJson = readJson(
    'helpers/dummy_data/dummy_products_list.json',
  );

  group('cache Product', () {
    test('should call setString of shared preferences', () async {
      when(
        mockSharedPreferences.setString(any, any),
      ).thenAnswer((_) async => true);
      await productLocalDataSourceImpl.cacheProduct(tProduct1);
      verify(mockSharedPreferences.setString(any, any));
    });
  });
  group('cache Products', () {
    test('should call set string of shared prefences', () async {
      when(
        mockSharedPreferences.setString(any, any),
      ).thenAnswer((_) async => true);
      await productLocalDataSourceImpl.cacheProducts(tProducts);
      verify(mockSharedPreferences.setString(any, any));
    });
  });
  group('get product', () {
    test('should return Product Model from shared preferences', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(tProduct1Json);
      final result = await productLocalDataSourceImpl.getLastProduct(
        tProductId1,
      );
      expect(result, tProduct1);
    });
    test('should throw Cache Exception when product not found', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = productLocalDataSourceImpl.getLastProduct;
      expect(
        () => call(tProductId1),
        throwsA(const TypeMatcher<CacheException>()),
      );
    });
  });
  group('getProducts', () {
    test('should return List<ProductModel> from shared preferences', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(productsListJson);

      final result = await productLocalDataSourceImpl.getLastProducts();

      expect(result, tProducts);
    });

    test('should throw CacheException when products not found', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      final call = productLocalDataSourceImpl.getLastProducts;

      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('deleteProduct', () {
    test('should call remove of shared preferences', () async {
      when(mockSharedPreferences.remove(any)).thenAnswer((_) async => true);

      await productLocalDataSourceImpl.deleteProduct(tProductId1);

      verify(mockSharedPreferences.remove(any));
    });
  });
}
