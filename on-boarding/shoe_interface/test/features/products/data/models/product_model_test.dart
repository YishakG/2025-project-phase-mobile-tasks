import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shoe_interface/features/product/data/models/product_model.dart';
import 'package:shoe_interface/features/product/domain/entities/product_entitiy.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  final testProductModel = const ProductModel(
    id: '12345',
    name: 'Nike SB Dunk Low Panda',
    description: 'Classic Panda colorway, leather upper, waffle outsole',
    imageUrl: 'https://.../images/12345.jpg',
    price: 100.0,
  );
  test('should be a sub class of Product Enitiy', () async {
    // assert
    expect(testProductModel, isA<ProductEntitiy>());
  });
  test('should return a valid model from a json', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_product_response.json'),
    );

    // act
    final result = ProductModel.fromJson(jsonMap);
    // assert
    expect(result, equals(testProductModel));
  });

  test('should return a json map from proper model', () async {
    // arrange

    // act
    final result = testProductModel.toJson();

    // assert
    final expectedJson = {
      'id': '12345',
      'name': 'Nike SB Dunk Low Panda',
      'description': 'Classic Panda colorway, leather upper, waffle outsole',
      'imageUrl': 'https://.../images/12345.jpg',
      'price': 100.0,
    };

    expect(result, equals(expectedJson));
  });
}
