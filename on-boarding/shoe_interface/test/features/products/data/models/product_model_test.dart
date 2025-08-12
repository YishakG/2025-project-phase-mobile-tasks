import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shoe_interface/features/product/data/models/product_model.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  var tProductModel = ProductModel(
    id: '12345',
    name: 'Nike SB Dunk Low Panda',
    description: 'Classic Panda colorway, leather upper, waffle outsole',
    imageUrl: 'https://.../images/12345.jpg',
    price: 100.0,
  );

  final tProductJson = jsonDecode(
    readJson('helpers/dummy_data/dummy_product_response.json'),
  );

  test('toJson should convert Product model to Json', () async {
    final result = tProductModel.toJson();

    final expectedJson = tProductJson;
    expect(result, expectedJson);
  });

  test('from JSON should convert JSON to Product Model', () async{
    final result = ProductModel.fromJson(tProductJson);
    expect(result, tProductModel);
  });
}
