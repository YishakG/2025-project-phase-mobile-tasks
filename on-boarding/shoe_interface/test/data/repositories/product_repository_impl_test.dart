import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/core/error/exceptions.dart';
import 'package:shoe_interface/core/error/failures.dart';
import 'package:shoe_interface/core/error/platform/network_info.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_local_data_source.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_remote_data_source.dart';
import 'package:shoe_interface/features/product/data/models/product_model.dart';
import 'package:shoe_interface/features/product/data/repositories/product_repository_impl.dart';

class MockRemoteSource extends Mock implements ProductRemoteDataSource {}

class MockLocalSource extends Mock implements ProductLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ProductRepositoryImpl productRepositoryImpl;
  late MockLocalSource mockLocalSource;
  late MockRemoteSource mockRemoteSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteSource = MockRemoteSource();
    mockLocalSource = MockLocalSource();
    productRepositoryImpl = ProductRepositoryImpl(
      productLocalDataSource: mockLocalSource,
      productRemoteDataSource: mockRemoteSource,
      networkInfo: mockNetworkInfo,
    );
    when(
      mockNetworkInfo.isConnected,
    ).thenAnswer((_) async => true); // Default to true
  });

  const tProductId = 'id';
  final tProduct = ProductModel(
    id: tProductId,
    name: 'name',
    description: 'description',
    imageUrl: 'https://product.image.com/id',
    price: 123.45,
  );
  final tProducts = [tProduct];
  group('when Network is available', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    group('viewAllProducts', () {
      test('should get products from remote data source', () async {
        // arrange
        when(
          mockRemoteSource.viewAllProducts(),
        ).thenAnswer((_) async => tProducts);

        // act
        final result = await productRepositoryImpl.viewAllProducts();
        // assert
        expect(result, Right(tProducts));
        verify(mockRemoteSource.viewAllProducts()).called(1);
      });

      test('should cache products from remote data source', () async {
        when(
          mockRemoteSource.viewAllProducts(),
        ).thenAnswer((_) async => tProducts);

        await productRepositoryImpl.viewAllProducts();

        verify(mockRemoteSource.viewAllProducts());
        verify(mockLocalSource.cacheProducts(tProducts));
      });

      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockRemoteSource.viewAllProducts(),
          ).thenThrow(const ServerException(message: 'Server Exception'));

          final result = await productRepositoryImpl.viewAllProducts();

          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });

    group('getProductById', () {
      test('should get product from remote data source', () async {
        when(
          mockRemoteSource.getProductById(tProductId),
        ).thenAnswer((_) async => tProduct);

        final result = await productRepositoryImpl.getProductById(tProductId);

        expect(result, Right(tProduct));
        verify(mockRemoteSource.getProductById(tProductId));
      });

      test('should cache product from remote data source', () async {
        when(
          mockRemoteSource.getProductById(tProductId),
        ).thenAnswer((_) async => tProduct);

        await productRepositoryImpl.getProductById(tProductId);

        verify(mockRemoteSource.getProductById(tProductId));
        verify(mockLocalSource.cacheProduct(tProduct));
      });

      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockRemoteSource.getProductById(tProductId),
          ).thenThrow(const ServerException(message: 'Server Exception'));

          final result = await productRepositoryImpl.getProductById(tProductId);

          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });

    group('createProduct', () {
      test('should create product from remote data source', () async {
        when(
          mockRemoteSource.createProduct(tProduct),
        ).thenAnswer((_) async => tProduct);

        final result = await productRepositoryImpl.createProduct(tProduct);

        expect(result, Right(tProduct));
        verify(mockRemoteSource.createProduct(tProduct));
      });

      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockRemoteSource.createProduct(tProduct),
          ).thenThrow(const ServerException(message: 'Server Exception'));

          final result = await productRepositoryImpl.createProduct(tProduct);

          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });

    group('deleteProduct', () {
      test('should delete product from remote data source', () async {
        await productRepositoryImpl.deleteProduct(tProductId);

        verify(mockRemoteSource.deleteProduct(tProductId));
      });

      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockRemoteSource.deleteProduct(tProductId),
          ).thenThrow(const ServerException(message: 'Server Exception'));

          final result = await productRepositoryImpl.deleteProduct(tProductId);

          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });

    group('updateProduct', () {
      test('should update product from remote data source', () async {
        when(
          mockRemoteSource.updateProduct(tProduct),
        ).thenAnswer((_) async => tProduct);

        final result = await productRepositoryImpl.updateProduct(tProduct);

        expect(result, Right(tProduct));

        verify(mockRemoteSource.updateProduct(tProduct));
      });

      test('should update cache product from remote data source', () async {
        when(
          mockRemoteSource.updateProduct(tProduct),
        ).thenAnswer((_) async => tProduct);

        await productRepositoryImpl.updateProduct(tProduct);

        verify(mockRemoteSource.updateProduct(tProduct));
        verify(mockLocalSource.cacheProduct(tProduct));
      });

      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockRemoteSource.updateProduct(tProduct),
          ).thenThrow(const ServerException(message: 'Server Exception'));

          final result = await productRepositoryImpl.updateProduct(tProduct);

          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });
  });

  group('when network is not available', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
    group('viewAllProducts', () {
      test('should get products from local data source', () async {
        when(
          mockLocalSource.getLastProducts(),
        ).thenAnswer((_) async => tProducts);

        final result = await productRepositoryImpl.viewAllProducts();

        expect(result, Right(tProducts));
        verify(mockLocalSource.getLastProducts());
      });

      test('should not call remote data source', () async {
        await productRepositoryImpl.viewAllProducts();

        verifyZeroInteractions(mockRemoteSource);
      });

      test(
        'should return cache failure when local data source throws cache exception',
        () async {
          when(
            mockLocalSource.getLastProducts(),
          ).thenThrow(const CacheException(message: 'Cache Exception'));

          final result = await productRepositoryImpl.viewAllProducts();

          expect(result, const Left(CacheFailure('Cache Exception')));
        },
      );
    });

    group('getProduct', () {
      test('should get product from local data source', () async {
        when(
          mockLocalSource.getLastProduct(tProductId),
        ).thenAnswer((_) async => tProduct);

        final result = await productRepositoryImpl.getProductById(tProductId);

        expect(result, Right(tProduct));
        verify(mockLocalSource.getLastProduct(tProductId));
      });
    });

    test('should not call remote data source', () async {
      await productRepositoryImpl.getProductById(tProductId);

      verifyZeroInteractions(mockRemoteSource);
    });

    test(
      'should return cache failure when local data source throws cache exception',
      () async {
        when(
          mockLocalSource.getLastProduct(tProductId),
        ).thenThrow(const CacheException(message: 'Cache Exception'));

        final result = await productRepositoryImpl.getProductById(tProductId);

        expect(result, const Left(CacheFailure('Cache Exception')));
      },
    );
  

  group('createProduct', () {
    test('should return network failure', () async {
      final result = await productRepositoryImpl.createProduct(tProduct);

      expect(result, const Left(NetworkFailure()));
    });
  });

  group('deleteProduct', () {
    test('should return network failure', () async {
      final result = await productRepositoryImpl.deleteProduct(tProductId);

      expect(result, const Left(NetworkFailure()));
    });
  });

  group('updateProduct', () {
    test('should return network failure', () async {
      final result = await productRepositoryImpl.updateProduct(tProduct);

      expect(result, const Left(NetworkFailure()));
    });
  });
  });
}
