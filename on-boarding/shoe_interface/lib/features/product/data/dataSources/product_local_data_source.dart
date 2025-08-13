import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
    Future<ProductModel> getLastProduct(String id);
    Future<List<ProductModel>> getLastProducts();
    Future<void> cacheProduct(ProductModel prooduct);
    Future<void> cacheProducts(List<ProductModel> productsToCache);
    Future<void> deleteProduct(String id);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource{
  final productCacheKey = 'PRODUCTS';
  final SharedPreferences sharedPreferences;
  ProductLocalDataSourceImpl({required this.sharedPreferences});

  getProductCacheKey(String id)=> '${productCacheKey}_$id';

  @override
  Future<void> cacheProduct(ProductModel product) async{
    // TODO: implement cacheProduct
    await sharedPreferences.setString(getProductCacheKey(product.id), jsonEncode(product.toJson()));
  }

  @override
  Future<void> cacheProducts(List<ProductModel> productsToCache) async{
    // TODO: implement cacheProducts
    await sharedPreferences.setString(productCacheKey, jsonEncode(productsToCache.map((e) => e.toJson()).toList()));
  }

  @override
  Future<void> deleteProduct(String id) {
    // TODO: implement deleteProduct
    return sharedPreferences.remove(getProductCacheKey(id));
   }

  @override
  Future<ProductModel> getLastProduct(String id) async {
    // TODO: implement getLastProduct
    final productJson = sharedPreferences.getString(getProductCacheKey(id));
    if (productJson != null){
      return ProductModel.fromJson(jsonDecode(productJson));
    }
    else{
      throw const CacheException(message: 'Product not found in cache');
    }
  }

  @override
  Future<List<ProductModel>> getLastProducts() async {
    // TODO: implement getLastProducts
    final productsJson = sharedPreferences.getString(productCacheKey);
    if (productsJson != null ){
      return (jsonDecode(productsJson) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();    }
  
  else{
    throw const CacheException(message: 'Products not found in cache');
  }
}}