class Product {
  // Private fields
  final String _id; // Immutable ID
  String _name;
  String _description;
  double _price;

  // Constructor with validation through setters
  Product(this._id, String name, String description, double price)
      : _name = name,
        _description = description,
        _price = price {
    this.name = name; // Use setters for validation
    this.description = description;
    this.price = price;
  }

  // Getters
  String get id => _id;
  String get name => _name;
  String get description => _description;
  double get price => _price;

  // Setters with validation
  set name(String value) {
    if (value.trim().isEmpty) throw Exception('Name cannot be empty');
    _name = value.trim();
  }

  set description(String value) {
    if (value.trim().isEmpty) throw Exception('Description cannot be empty');
    _description = value.trim();
  }

  set price(double value) {
    if (value < 0) throw Exception('Price cannot be negative');
    _price = value;
  }

  @override
  String toString() {
    return '''
ID: $_id
Name: $_name
Description: $_description
Price: \$${_price.toStringAsFixed(2)}
''';
  }
}

class ProductManager {
  final Map<String, Product> _products = {};

  void addProduct(String id, String name, String description, double price) {
    if (_products.containsKey(id)) {
      throw Exception('Product with ID $id already exists.');
    }
    _products[id] = Product(id, name, description, price);
    print('✅ Product added successfully.');
    print('===========================');
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print('⚠️ No products available.');
      return;
    }
    print('\n=== All Products ===');
    _products.forEach((id, product) {
      print(product.toString());
      print('-------------------------');
    });
  }

  void viewProduct(String id) {
    final product = _products[id];
    if (product == null) {
      throw Exception('❌ Product with ID $id not found.');
    }
    print('\n=== Product Details ===');
    print(product.toString());
  }

  void editProduct(
    String id, {
    String? name,
    String? description,
    double? price,
  }) {
    final product = _products[id];
    if (product == null) {
      throw Exception('❌ Product with ID $id not found.');
    }
    if (name != null) product.name = name;
    if (description != null) product.description = description;
    if (price != null) product.price = price;
    print('✅ Product updated successfully.');
  }

  void deleteProduct(String id) {
    if (!_products.containsKey(id)) {
      throw Exception('❌ Product with ID $id not found.');
    }
    _products.remove(id);
    print('✅ Product deleted successfully.');
  }
}

void main() {
  final manager = ProductManager();

  try {
    manager.addProduct('1', 'Laptop', 'High-performance laptop.', 1200.0);
    manager.addProduct('2', 'Smartphone', 'Latest smartphone model.', 800.0);

    manager.viewAllProducts();

    manager.viewProduct('1');

    manager.editProduct('1', name: 'Gaming Laptop', price: 2000.0);

    manager.viewProduct('1');

    manager.deleteProduct('2');

    manager.viewAllProducts();
  } catch (e) {
    print('Error: $e');
  }
}

