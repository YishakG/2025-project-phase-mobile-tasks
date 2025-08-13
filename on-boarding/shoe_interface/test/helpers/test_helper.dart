import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_interface/core/error/platform/network_info.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_local_data_source.dart';
import 'package:shoe_interface/features/product/data/dataSources/product_remote_data_source.dart';
import 'package:shoe_interface/features/product/domain/repositories/product_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  ProductRepository,
  NetworkInfo,
  ProductRemoteDataSource,
  ProductLocalDataSource,
  InternetConnectionChecker,
  SharedPreferences,
  http.Client
])
void main() {}
