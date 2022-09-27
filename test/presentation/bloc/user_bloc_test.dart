import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_development_test/domain/entities/user.dart';
import 'package:mobile_development_test/domain/usecases/add_user.dart';
import 'package:mobile_development_test/domain/usecases/get_user_list.dart';
import 'package:mobile_development_test/presentation/bloc/user_bloc.dart';
import 'package:mobile_development_test/presentation/bloc/user_event.dart';
import 'package:mobile_development_test/presentation/bloc/user_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_bloc_test.mocks.dart';

@GenerateMocks([GetUserList, AddUser])
void main() {
  late MockGetUserList mockGetUserList;
  late MockAddUser mockAddUser;
  late UserBloc userBloc;

  setUp(() {
    mockGetUserList = MockGetUserList();
    mockAddUser = MockAddUser();
    userBloc = UserBloc(mockGetUserList, mockAddUser);
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

  test('initial state should be empty', () {
    expect(userBloc.state, UserEmpty());
  });

  blocTest<UserBloc, UserState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetUserList.execute())
          .thenAnswer((_) async => const Right(tListUser));
      return userBloc;
    },
    act: (bloc) => bloc.add(const OnUserChanged("")),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      UserLoading(),
      const UserHasData(tListUser),
    ],
    verify: (bloc) {
      verify(mockGetUserList.execute());
    },
  );
}
