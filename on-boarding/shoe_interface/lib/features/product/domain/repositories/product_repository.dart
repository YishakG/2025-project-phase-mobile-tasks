import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product_entitiy.dart';

abstract class ProductRepository {
  Future<Either<Failure,  List<ProductEntitiy>>> viewAllProducts();
  Future<Either<Failure, ProductEntitiy>> getProductById(String id);
  Future<Either<Failure, ProductEntitiy>> createProduct(ProductEntitiy product);
  Future<Either<Failure, ProductEntitiy>> updateProduct(ProductEntitiy product);
  Future<Either<Failure, Unit>> deleteProduct(String id);
}
