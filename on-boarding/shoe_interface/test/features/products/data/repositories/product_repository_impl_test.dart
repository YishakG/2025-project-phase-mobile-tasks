import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/core/error/exceptions.dart';
import 'package:shoe_interface/core/error/failures.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_remote_data_source.dart';
import 'package:shoe_interface/features/product/data/models/product_model.dart';
import 'package:shoe_interface/features/product/data/repositories/product_repository_impl.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late MockProductLocalDataSource mockProductLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late ProductRepositoryImpl productRepository;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockProductLocalDataSource = MockProductLocalDataSource();
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    productRepository = ProductRepositoryImpl(
      productLocalDataSource: mockProductLocalDataSource,
      networkInfo: mockNetworkInfo,
      productRemoteDataSource: mockProductRemoteDataSource,
    );
  });

  const tProductId = 'id';
  final tProduct = ProductModel(
    id: tProductId,
    name: 'test',
    description: 'test',
    imageUrl: 'test',
    price: 100,
  );
  final tProducts = [tProduct];

  group('when network is availabel', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    group('get List of Products', () {
      test('should get products from remote data source', () async {
        when(
          mockProductRemoteDataSource.viewAllProducts(),
        ).thenAnswer((_) async => tProducts);

        final result = await productRepository.viewAllProducts();
        expect(result, Right(tProducts));
        verify(mockProductRemoteDataSource.viewAllProducts());
      });
      test('should cache products from remote data source', () async {
        when(
          mockProductRemoteDataSource.viewAllProducts(),
        ).thenAnswer((_) async => tProducts);

        await productRepository.viewAllProducts();
        verify(mockProductRemoteDataSource.viewAllProducts());
        verify(mockProductLocalDataSource.cacheProducts(tProducts));
      });
      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockProductRemoteDataSource.viewAllProducts(),
          ).thenThrow(const ServerException(message: 'Server Exception'));
          final result = await productRepository.viewAllProducts();
          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });

    group('get  as single product', () {
      test('should get product from remote data source', () async {
        when(
          mockProductRemoteDataSource.getProductById(tProductId),
        ).thenAnswer((_) async => tProduct);

        final result = await productRepository.getProductById(tProductId);

        expect(result, Right(tProduct));
        verify(mockProductRemoteDataSource.getProductById(tProductId));
      });

      test('should cache product form remote data source', () async {
        when(
          mockProductRemoteDataSource.getProductById(tProductId),
        ).thenAnswer((_) async => tProduct);

        await productRepository.getProductById(tProductId);

        verify(mockProductRemoteDataSource.getProductById(tProductId));
        verify(mockProductLocalDataSource.cacheProduct(tProduct));
      });

      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockProductRemoteDataSource.getProductById(tProductId),
          ).thenThrow(const ServerException(message: 'Server Exception'));
          final result = await productRepository.getProductById(tProductId);
          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });
    group('create Product', () {
      test('should create product from remote data source', () async {
        when(
          mockProductRemoteDataSource.createProduct(tProduct),
        ).thenAnswer((_) async => tProduct);
        final result = await productRepository.createProduct(tProduct);
        expect(result, Right(tProduct));
        verify(mockProductRemoteDataSource.createProduct(tProduct));
      });
      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockProductRemoteDataSource.createProduct(tProduct),
          ).thenThrow(const ServerException(message: 'Server Exception'));
          final result = await productRepository.createProduct(tProduct);
          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });
    group('delete Product', () {
      test('should delete product from remote data source', () async {
        await productRepository.deleteProduct(tProductId);
        verify(mockProductRemoteDataSource.deleteProduct(tProductId));
      });

      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockProductRemoteDataSource.deleteProduct(tProductId),
          ).thenThrow(const ServerException(message: 'Server Exception'));
          final result = await productRepository.deleteProduct(tProductId);
          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });

    group('update Product', () {
      test('should update product from remote data source', () async {
        when(
          mockProductRemoteDataSource.updateProduct(tProduct),
        ).thenAnswer((_) async => tProduct);
        final result = await productRepository.updateProduct(tProduct);
        expect(result, Right(tProduct));
        verify(mockProductRemoteDataSource.updateProduct(tProduct));
      });

      test('should catche product from remote data source', () async {
        when(
          mockProductRemoteDataSource.updateProduct(tProduct),
        ).thenAnswer((_) async => tProduct);
        await productRepository.updateProduct(tProduct);

        verify(mockProductRemoteDataSource.updateProduct(tProduct));
        verify(mockProductLocalDataSource.cacheProduct(tProduct));
      });

      test(
        'should return server failure when remote data source throws server exception',
        () async {
          when(
            mockProductRemoteDataSource.updateProduct(tProduct),
          ).thenThrow(const ServerException(message: 'Server Exception'));
          final result = await productRepository.updateProduct(tProduct);
          expect(result, const Left(ServerFailure('Server Exception')));
        },
      );
    });
  });
  group('when network is not available', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
    group('get Products', () {
      test('should get products from local data source', () async {
        when(
          mockProductLocalDataSource.getLastProducts(),
        ).thenAnswer((_) async => tProducts);
        final result = await productRepository.viewAllProducts();
        expect(result, Right(tProducts));
      });
      test('should not call remote data source', () async {
        when(
          mockProductLocalDataSource.getLastProducts(),
        ).thenAnswer((_) async => []);
        await productRepository.viewAllProducts();
        verifyZeroInteractions(mockProductRemoteDataSource);
      });
      test(
        'should return cache failure when local data source throws cache exception',
        () async {
          when(
            mockProductLocalDataSource.getLastProducts(),
          ).thenThrow(const CacheException(message: 'Cache Exception'));
          final result = await productRepository.viewAllProducts();
          expect(result, const Left(CacheFailure('Cache Exception')));
        },
      );
    });
    group('create Product', () {
      test('should return network failure', () async {
        final result = await productRepository.createProduct(tProduct);
        expect(result, const Left(NetworkFailure()));
      });
    });
    group('delete Product', () {
      test('should return network failure', () async {
        final result = await productRepository.deleteProduct(tProductId);
        expect(result, const Left(NetworkFailure()));
      });
    });
    group('update product', () {
      test('should return network failure', () async {
        final result = await productRepository.updateProduct(tProduct);
        expect(result, const Left(NetworkFailure()));
      });
    });
  });
}
