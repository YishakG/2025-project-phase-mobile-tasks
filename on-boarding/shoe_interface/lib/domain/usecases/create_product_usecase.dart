import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/product_entitiy.dart';
import '../repositories/product_repository.dart';

class CreateProductUsecase {
  ProductRepository productRepository;
  CreateProductUsecase(this.productRepository);

  Future<Either<Failure, ProductEntitiy>> execute(ProductEntitiy product) {
    return productRepository.createProduct(product);
  }
}
