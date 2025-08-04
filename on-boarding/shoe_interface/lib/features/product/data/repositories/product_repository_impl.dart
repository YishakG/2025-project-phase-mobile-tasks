import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/platform/network_info.dart';
import '../../domain/entities/product_entitiy.dart';
import '../../domain/repositories/product_repository.dart';
import '../dataSources/product_local_data_source.dart';
import '../dataSources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.productLocalDataSource,
    required this.networkInfo,
    required this.productRemoteDataSource,
  });
  @override
  Future<Either<Failure, ProductEntitiy>> createProduct(
    ProductEntitiy product,
  ) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductEntitiy>> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductEntitiy>> updateProduct(
    ProductEntitiy product,
  ) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntitiy>>> viewAllProducts() {
    // TODO: implement viewAllProducts
    throw UnimplementedError();
  }
}
