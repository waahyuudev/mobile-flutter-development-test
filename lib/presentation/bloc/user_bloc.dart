import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_development_test/domain/usecases/get_user_list.dart';
import 'package:mobile_development_test/presentation/bloc/user_event.dart';
import 'package:mobile_development_test/presentation/bloc/user_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/add_user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserList _getUserList;
  final AddUser _addUser;

  UserBloc(this._getUserList, this._addUser) : super(UserEmpty()) {
    on<OnUserChanged>((event, emit) async {
      emit(UserLoading());

      final result = await _getUserList.execute();
      result.fold(
          (l) => emit(UserError(l.message)), (r) {
            if (event.name.isNotEmpty || event.name != "") {
              List<User> userByName = r.where((item) => item.name.toLowerCase().contains(event.name.toLowerCase())).toList();
              userByName.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
              emit(UserHasData(userByName));
            } else {
              emit(UserHasData(r));
            }

      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
    on<OnUserChangedByCity>((event, emit) async {
      emit(UserLoading());

      final result = await _getUserList.execute();
      result.fold(
              (l) => emit(UserError(l.message)), (r) {
        if (event.cityName.isNotEmpty || event.cityName != "") {
          List<User> userByName = r.where((item) => item.city.toLowerCase().contains(event.cityName.toLowerCase())).toList();
          userByName.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
          emit(UserHasData(userByName));
        } else {
          emit(UserHasData(r));
        }

      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
    on<OnUserAdded>((event, emit) async {
      emit(UserLoading());

      final result = await _addUser.execute(event.userModel);
      result.fold(
              (l) => emit(UserError(l.message)), (r) {
        emit(UserSuccessAdded());
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
