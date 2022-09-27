import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_development_test/data/constants.dart';
import 'package:mobile_development_test/data/datasources/remote_data_source.dart';
import 'package:mobile_development_test/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSourceImpl = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get list user', () {
    final dummyData =
        jsonDecode(readJson('helpers/dummy_data/dummy_user_response.json'));
    final tListUserModel =
        dummyData.map<UserModel>((item) => UserModel.fromJson(item)).toList();

    test('should return user model when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(userList))).thenAnswer((_) async =>
          http.Response(
              readJson('helpers/dummy_data/dummy_user_response.json'), 200));

      // act
      final result = await dataSourceImpl.getListUser();

      // assert
      expect(result, equals(tListUserModel));
    });
  });
}
