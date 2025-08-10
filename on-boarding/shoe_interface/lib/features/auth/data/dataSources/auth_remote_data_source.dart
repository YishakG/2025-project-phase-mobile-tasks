import 'dart:convert';

import '../../../../core/error/exceptions.dart';
import '../models/auth_models.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<AuthModels> login({required String email, required String password});

  Future<AuthModels> signup({
    required String name,
    required String email,
    required String password,
  });

  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  static const baseUrl =
      'https://g5-flutter-learning-path-be-tvum.onrender.com/api/v2';

  AuthRemoteDataSourceImpl(this.client);
  @override
  Future<AuthModels> login({
    required String email,
    required String password,
  }) async {
    // TODO: implement login
    final response = await client.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body)['data']['access_token'];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<AuthModels> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      return AuthModels.fromJson(json.decode(response.body)['data']);
    } else {
      throw ServerException();
    }
  }
}
