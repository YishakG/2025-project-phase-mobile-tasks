import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/product_entitiy.dart';
import '../repositories/product_repository.dart';

class UpdateProductUsecase {
  ProductRepository productRepository;
  UpdateProductUsecase(this.productRepository);

  Future<Either<Failure, ProductEntitiy>> execute(
    ProductEntitiy product,
  ) async {
    return await productRepository.updateProduct(product);
  }
}
