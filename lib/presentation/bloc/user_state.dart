import 'package:equatable/equatable.dart';
import 'package:mobile_development_test/domain/entities/user.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserEmpty extends UserState {}

class UserSuccessAdded extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}

class UserHasData extends UserState {
  final List<User> user;

  const UserHasData(this.user);

  @override
  List<Object?> get props => [user];
}
