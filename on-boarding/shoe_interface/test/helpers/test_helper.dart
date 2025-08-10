import 'package:mockito/annotations.dart';
import 'package:shoe_interface/features/product/domain/repositories/product_repository.dart';
import 'package:shoe_interface/features/auth/domain/repositories/auth_repository.dart';

// import 'package:http/http.dart' as http;
@GenerateMocks(
  [ProductRepository,
    AuthRepository,
  ],
  // customMocks: [MockSpec<http.Client>(as: #MockHttpClient)]
)
void main() {}
