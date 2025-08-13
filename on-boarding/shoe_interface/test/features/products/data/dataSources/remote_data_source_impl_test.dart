import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/core/constants/constants.dart';
import 'package:shoe_interface/core/error/exceptions.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_remote_data_source.dart';
import 'package:shoe_interface/features/product/data/models/product_model.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;
  late MockClient mockClient;

  setUp((){
    mockClient = MockClient();
    productRemoteDataSourceImpl = ProductRemoteDataSourceImpl(client: mockClient, baseUrl: 'http://localhost:3000/api/v1');
  });

  const baseUrl = 'http://localhost:3000/api/v1';
  const tProductId1 = "12345";
  const tProdcutId2 = "6789";

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
  group('getProducts', () {
    test(
      'should return list of products when the response code is 200',
      () async {
        when(
          mockClient.get(Uri.parse('$baseUrl/products')),
        ).thenAnswer((_) async => http.Response(productsListJson, 200));

        final result = await productRemoteDataSourceImpl.viewAllProducts();

        expect(result, tProducts);
      },
    );

    test(
      'should throw ServerException when the response code is not 200',
      () async {
        when(
          mockClient.get(Uri.parse('$baseUrl/products')),
        ).thenAnswer((_) async => http.Response('Not Found', 404));

        final call = productRemoteDataSourceImpl.viewAllProducts;

        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });
  group('getProduct', () {
    test('should return product when the response code is 200', () async {
      when(
        mockClient.get(Uri.parse('$baseUrl/products/$tProductId1')),
      ).thenAnswer((_) async => http.Response(tProduct1Json, 200));

      final result = await productRemoteDataSourceImpl.getProductById(tProductId1);

      expect(result, tProduct1);
    });

    test(
      'should throw ServerException when the response code is not 200',
      () async {
        when(
          mockClient.get(Uri.parse('$baseUrl/products/$tProductId1')),
        ).thenAnswer((_) async => http.Response('Not Found', 404));

        final call = productRemoteDataSourceImpl.getProductById;

        expect(() => call(tProductId1), throwsA(isA<ServerException>()));
      },
    );
  });
  group('createProduct', () {
    test('should return product when the response code is 201', () async {
      when(
        mockClient.post(
          Uri.parse('$baseUrl/products'),
          headers: defaultHeaders,
          body: jsonEncode(tProduct1.toJson()),
        ),
      ).thenAnswer((_) async => http.Response(tProduct1Json, 201));

      final result = await productRemoteDataSourceImpl.createProduct(tProduct1);

      expect(result, tProduct1);
    });

    test(
      'should throw ServerException when the response code is not 201',
      () async {
        when(
          mockClient.post(
            Uri.parse('$baseUrl/products'),
            headers: defaultHeaders,
            body: jsonEncode(tProduct1.toJson()),
          ),
        ).thenAnswer((_) async => http.Response('Not Found', 404));

        final call = productRemoteDataSourceImpl.createProduct;

        expect(() => call(tProduct1), throwsA(isA<ServerException>()));
      },
    );
  });
  group('updateProduct', () {
    test('should return product when the response code is 200', () async {
      when(
        mockClient.put(
          Uri.parse('$baseUrl/products/$tProductId1'),
          headers: defaultHeaders,
          body: jsonEncode(tProduct1.toJson()),
        ),
      ).thenAnswer((_) async => http.Response(tProduct1Json, 200));

      final result = await productRemoteDataSourceImpl.updateProduct(tProduct1);

      expect(result, tProduct1);
    });

    test(
      'should throw ServerException when the response code is not 200',
      () async {
        when(
          mockClient.put(
            Uri.parse('$baseUrl/products/$tProductId1'),
            headers: defaultHeaders,
            body: jsonEncode(tProduct1.toJson()),
          ),
        ).thenAnswer((_) async => http.Response('Not Found', 404));

        final call = productRemoteDataSourceImpl.updateProduct;

        expect(() => call(tProduct1), throwsA(isA<ServerException>()));
      },
    );
  });
   group('deleteProduct', () {
    test('should make delete request', () async {
      when(
        mockClient.delete(Uri.parse('$baseUrl/products/$tProductId1')),
      ).thenAnswer((_) async => http.Response(tProduct1Json, 200));

      await productRemoteDataSourceImpl.deleteProduct(tProductId1);

      verify(
        mockClient.delete(Uri.parse('$baseUrl/products/$tProductId1')),
      ).called(1);
    });

    test(
      'should throw ServerException when the response code is not 200',
      () async {
        when(
          mockClient.delete(Uri.parse('$baseUrl/products/$tProductId1')),
        ).thenAnswer((_) async => http.Response('Not Found', 404));

        final call = productRemoteDataSourceImpl.deleteProduct;

        expect(() => call(tProductId1), throwsA(isA<ServerException>()));
      },
    );
  });
}