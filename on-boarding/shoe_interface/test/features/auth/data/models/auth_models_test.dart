import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shoe_interface/features/auth/data/models/auth_models.dart';
import 'package:shoe_interface/features/auth/domain/entities/auth_entity.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  const tname = 'test';
  const tid = 'test';
  const temail = 'test@gmail.com';
  const ttoken = 'test';
  const tModel = AuthModels(
    name: tname,
    id: tid,
    email: temail,
    authtoken: ttoken,
  );
 group('Auth Model tests', (){
  test('should be a subclass of auth entity', () async {
    // assert
    expect(tModel, isA<AuthEntity>());
  });

  test('should return a valid model from a json', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_user_response.json'),
    );

    // act
    final result = AuthModels.fromJson(jsonMap);

    // assert
    expect(result, equals(tModel));
  });

  test('should return a json map from a proper model', () async {
    // arrange

    // act
    final result = tModel.toJson();

    // assert
    final expectedJson = {
      'id': 'test',
      'name': 'test',
      'email': 'test@gmail.com',
      'token': 'test',
    };

    expect(result, expectedJson);
  });
 });
}
