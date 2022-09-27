import 'dart:convert';

import 'package:mobile_development_test/data/constants.dart';
import 'package:mobile_development_test/data/exception.dart';
import 'package:mobile_development_test/data/models/city_model.dart';
import 'package:mobile_development_test/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<UserModel>> getListUser();

  Future<bool> addUser(UserModel userModel);

  Future<List<CityModel>> getListCity();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getListUser() async {
    final response = await client.get(Uri.parse(userList));

    if (response.statusCode == 200) {
      var dynamicList = jsonDecode(response.body);
      var userList = dynamicList
          .map<UserModel>((item) => UserModel.fromJson(item))
          .toList();

      return userList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CityModel>> getListCity() async {
    final response = await client.get(Uri.parse(cityList));

    if (response.statusCode == 200) {
      var dynamicList = jsonDecode(response.body);
      var cityList = dynamicList
          .map<CityModel>((item) => CityModel.fromJson(item))
          .toList();

      return cityList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> addUser(UserModel userModel) async {
    final response = await client.post(Uri.parse(userList),
        body: jsonEncode(userModel),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        });

    if (response.statusCode == 201) {
      return true;
    } else {
      throw ServerException();
    }
  }
}
