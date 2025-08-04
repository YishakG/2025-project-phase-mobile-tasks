import 'package:equatable/equatable.dart';

class ProductEntitiy extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  const ProductEntitiy({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  @override
  List<Object> get props => [id, name, description, imageUrl, price];
}
