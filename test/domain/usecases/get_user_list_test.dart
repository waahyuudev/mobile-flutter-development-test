import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_development_test/domain/entities/user.dart';
import 'package:mobile_development_test/domain/usecases/get_user_list.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockUserRepository mockUserRepository;
  late GetUserList useCase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = GetUserList(mockUserRepository);
  });

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

  test('should get user list from repository', () async {

    // arrange
    when(mockUserRepository.getUserList()).thenAnswer((_) async => const Right(tListUser));

    // act
    final result = await useCase.execute();

    // assert
    expect(result, equals(const Right(tListUser)));

  });

}