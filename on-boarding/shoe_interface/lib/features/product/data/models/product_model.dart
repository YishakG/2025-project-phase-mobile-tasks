import '../../domain/entities/product_entitiy.dart';

class ProductModel extends ProductEntitiy {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    imageUrl: json['imageUrl'],
    price: json['price'],
  );

  Map<String, dynamic> toJson() => {
    'id':id,
    'name':name,
    'description':description,
    'imageUrl':imageUrl,
    'price':price
  };
}
