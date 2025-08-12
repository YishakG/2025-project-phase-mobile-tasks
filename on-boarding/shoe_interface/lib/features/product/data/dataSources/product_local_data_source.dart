import '../models/product_model.dart';

abstract class ProductLocalDataSource {
    Future<ProductModel> getLastProduct(String id);
    Future<List<ProductModel>> getLastProducts();
    Future<void> cacheProduct(ProductModel prooduct);
    Future<void> cacheProducts(List<ProductModel> productsToCache);
    Future<void> deleteProduct(String id);
}
