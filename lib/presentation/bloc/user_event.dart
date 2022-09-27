import 'package:equatable/equatable.dart';
import 'package:mobile_development_test/data/models/user_model.dart';
import 'package:mobile_development_test/domain/entities/user.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class OnUserChanged extends UserEvent {
  final String name;

  const OnUserChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class OnUserChangedByCity extends UserEvent {
  final String cityName;

  const OnUserChangedByCity(this.cityName);

  @override
  List<Object?> get props => [cityName];
}

class OnUserAdded extends UserEvent {
  final UserModel userModel;

  const OnUserAdded(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

