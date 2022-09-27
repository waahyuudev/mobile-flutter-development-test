
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_development_test/data/models/user_model.dart';
import 'package:mobile_development_test/data/repositories/user_repository_impl.dart';
import 'package:mobile_development_test/domain/entities/user.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late UserRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = UserRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  const tListUserModel = [
    UserModel(
        name: "WAHYU",
        address: "JL Lio Baru",
        email: "waahyuudev@gmail.com",
        phoneNumber: "083897487415",
        city: "Tangerang",
        id: "1"),
    UserModel(
        name: "FADLI",
        address: "JL Daan Mogot",
        email: "fadli@gmail.com",
        phoneNumber: "083897487417",
        city: "Tangerang",
        id: "1"),
    UserModel(
        name: "FAJAR",
        address: "JL Lio Baru",
        email: "fajar@gmail.com",
        phoneNumber: "083897487416",
        city: "Tangerang",
        id: "1")
  ];

  const tListUser = [
    User(
        name: "WAHYU",
        address: "JL Lio Baru",
        email: "waahyuudev@gmail.com",
        phoneNumber: "083897487415",
        city: "Tangerang",
        id: "1"),
    User(
        name: "FADLI",
        address: "JL Daan Mogot",
        email: "fadli@gmail.com",
        phoneNumber: "083897487417",
        city: "Tangerang",
        id: "1"),
    User(
        name: "FAJAR",
        address: "JL Lio Baru",
        email: "fajar@gmail.com",
        phoneNumber: "083897487416",
        city: "Tangerang",
        id: "1")
  ];

  group('get list user', () {
    test('should return list user when a call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getListUser())
          .thenAnswer((_) async => tListUserModel);

      // act
      final result = await repository.getUserList();

      // assert
      verify(mockRemoteDataSource.getListUser());
      expect(result, equals(const Right(tListUser)));
    });
  });
}
