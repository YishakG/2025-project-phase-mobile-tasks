import '../../domain/entities/product_entitiy.dart';
import 'product_model.dart';

extension ProductModelMappers on ProductModel {
  ProductEntitiy toEntity() => ProductEntitiy(
    id: id,
    name: name,
    description: description,
    imageUrl: imageUrl,
    price: price,
  );
}

extension ProductEntitiyMappers on ProductEntitiy {
  ProductModel toModel() => ProductModel(
    id: id,
    name: name,
    description: description,
    imageUrl: imageUrl,
    price: price,
  );
}
