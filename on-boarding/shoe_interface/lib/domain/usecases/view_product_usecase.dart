import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/product_entitiy.dart';
import '../repositories/product_repository.dart';

class ViewProductUsecase {
  final ProductRepository productRepository;
  ViewProductUsecase(this.productRepository);

  Future<Either<Failure, ProductEntitiy>> execute(String id) {
    return productRepository.getProductById(id);
  }
}
