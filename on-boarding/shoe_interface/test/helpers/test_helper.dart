import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shoe_interface/core/error/platform/network_info.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_local_data_source.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_remote_data_source.dart';
import 'package:shoe_interface/features/product/domain/repositories/product_repository.dart';

@GenerateMocks([
  ProductRepository,
  NetworkInfo,
  ProductRemoteDataSource,
  ProductLocalDataSource,
  InternetConnectionChecker

])
void main() {}
