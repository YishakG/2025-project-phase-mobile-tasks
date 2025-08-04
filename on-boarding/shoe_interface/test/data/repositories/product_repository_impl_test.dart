import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/core/error/platform/network_info.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_local_data_source.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_remote_data_source.dart';
import 'package:shoe_interface/features/product/data/repositories/product_repository_impl.dart';

class MockRemoteSource extends Mock implements ProductRemoteDataSource {}

class MockLocalSource extends Mock implements ProductLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ProductRepositoryImpl productRepositoryImpl;
  MockLocalSource mockLocalSource;
  MockRemoteSource mockRemoteSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteSource = MockRemoteSource();
    mockLocalSource = MockLocalSource();
    productRepositoryImpl = ProductRepositoryImpl(
      productLocalDataSource: mockLocalSource,
      productRemoteDataSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
