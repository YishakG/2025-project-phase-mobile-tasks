import 'dart:async';

import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> createProduct(ProductModel product);

  Future<void> deleteProduct(String id);

  Future<ProductModel> getProductById(String id);

  Future<ProductModel> updateProduct(ProductModel product);

  Future<List<ProductModel>> viewAllProducts();
}
