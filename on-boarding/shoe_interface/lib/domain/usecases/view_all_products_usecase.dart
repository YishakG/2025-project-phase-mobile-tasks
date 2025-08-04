import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/product_entitiy.dart';
import '../repositories/product_repository.dart';

class ViewAllProductsUsecase {
  final ProductRepository productRepository;

  ViewAllProductsUsecase(this.productRepository);

  Future<Either<Failure, List<ProductEntitiy>>> execute() {
    return productRepository.viewAllProducts();
  }
}
