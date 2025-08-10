import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/platform/network_info.dart';
import '../../domain/entities/product_entitiy.dart';
import '../../domain/repositories/product_repository.dart';
import '../dataSources/product_local_data_source.dart';
import '../dataSources/product_remote_data_source.dart';
import '../models/product_mappers.dart';

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
  ) async {
    final productModel = product.toModel();
    // TODO: implement createProduct
    if (await networkInfo.isConnected){
      try{
        await productRemoteDataSource.createProduct(productModel);
        productLocalDataSource.cacheProduct(productModel);
        return Right(product);
      }
      on ServerException catch (e){
        return Left(ServerFailure(e.message));
      }
    }
    else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async{
    // TODO: implement deleteProduct
    if (await networkInfo.isConnected){
      try{
        await productRemoteDataSource.deleteProduct(id);
        productLocalDataSource.deleteProduct(id);
        return const Right(unit);
      }
      on ServerException catch (e){
        return Left(ServerFailure(e.message));
      }
    }
    else{
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntitiy>> getProductById(String id) async {
    // TODO: implement getProductById
    if (await networkInfo.isConnected){
      try{
        final product = await productRemoteDataSource.getProductById(id);
        productLocalDataSource.cacheProduct(product);
        return Right(product);
      }
      on ServerException catch (e){
        return Left(ServerFailure(e.message));
      }
    }
    else{
      try{
        final product = await productLocalDataSource.getLastProduct(id);
        return Right(product);
      }
      on CacheException catch (e){
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, ProductEntitiy>> updateProduct(
    ProductEntitiy product,
  ) async{
    // TODO: implement updateProduct
    final productModel = product.toModel();
    if (await networkInfo.isConnected){
      try{
        await productRemoteDataSource.updateProduct(productModel);
        productLocalDataSource.cacheProduct(productModel);
        return Right(product);
      }
      on ServerException catch (e){
        return Left(ServerFailure(e.message));
      }
    }
    else{
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntitiy>>> viewAllProducts() async{
    // TODO: implement viewAllProducts
    if (await networkInfo.isConnected){
      try{
        final products = await productRemoteDataSource.viewAllProducts();
        productLocalDataSource.cacheProducts(products);
        return Right(products);
      }
      on ServerException catch(e){
        return Left(ServerFailure(e.message));
      }
    }
    else{
      try{
        final products = await productLocalDataSource.getLastProducts();
        return Right(products);
      } on CacheException catch (e){
        return Left(CacheFailure(e.message));
      }
    }
  }
}
