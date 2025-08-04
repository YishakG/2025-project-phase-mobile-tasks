import 'dart:async';


import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> createProduct(ProductModel product);

  @override
  Future<void> deleteProduct(String id);

  @override
  Future<ProductModel> getProductById(String id);

  @override
  Future<ProductModel> updateProduct(ProductModel product);

  @override
  Future<List<ProductModel>> viewAllProducts();
}
