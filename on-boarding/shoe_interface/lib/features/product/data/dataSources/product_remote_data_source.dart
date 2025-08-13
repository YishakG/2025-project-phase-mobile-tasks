import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as client;

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<ProductModel> createProduct(ProductModel product);

  Future<void> deleteProduct(String id);

  Future<ProductModel> getProductById(String id);

  Future<ProductModel> updateProduct(ProductModel product);

  Future<List<ProductModel>> viewAllProducts();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  late final http.Client client;
  final String baseUrl;

  ProductRemoteDataSourceImpl({required this.client, required String baseUrl})
    : baseUrl = '$baseUrl/products';
  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    // TODO: implement createProduct
    try {
      final response = await client.post(
        Uri.parse(baseUrl),
        body: jsonEncode(product.toJson()),
        headers: defaultHeaders,
      );

      if (response.statusCode == 201) {
        return ProductModel.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    // TODO: implement deleteProduct
    try {
      final response = await client.delete(Uri.parse('$baseUrl/$id'));

      if (response.statusCode != 200) {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    // TODO: implement getProductById
    try {
      final response = await client.get(Uri.parse('$baseUrl/$id'));

      if (response.statusCode == 200) {
        return ProductModel.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    // TODO: implement updateProduct
    try {
      final response = await client.put(
        Uri.parse('$baseUrl/${product.id}'),
        body: jsonEncode(product.toJson()),
        headers: defaultHeaders,
      );

      if (response.statusCode == 200) {
        return ProductModel.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> viewAllProducts() async {
    // TODO: implement viewAllProducts
    try {
      final response = await client.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> products = jsonDecode(response.body);
        return products.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw ServerException(message: response.body);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
