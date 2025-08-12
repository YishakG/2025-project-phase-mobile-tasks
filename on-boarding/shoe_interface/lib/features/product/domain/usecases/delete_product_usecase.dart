import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/product_repository.dart';

class DeleteProductUsecase {
  ProductRepository productRepository;
  DeleteProductUsecase(this.productRepository);

  Future<Either<Failure, Unit>> execute(String id) async {
    return await productRepository.deleteProduct(id);
  }
}
