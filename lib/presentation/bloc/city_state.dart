import 'package:equatable/equatable.dart';

import '../../domain/entities/city.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object?> get props => [];
}

class CityError extends CityState {
  final String message;

  const CityError(this.message);

  @override
  List<Object?> get props => [message];
}

class CityHasData extends CityState {
  final List<City> city;

  const CityHasData(this.city);

  @override
  List<Object?> get props => [city];
}

class CityLoading extends CityState {}
class CityEmpty extends CityState {}