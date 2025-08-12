import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<ProductModel> getLastProduct(String id);
  Future<List<ProductModel>> getLastProducts();
  Future<void> deleteProduct(String id);
  Future<void> cacheProducts(List<ProductModel> products);
  Future<void> cacheProduct(ProductModel productToCache);
}
