import 'package:dartz/dartz.dart';
import 'package:mobile_development_test/domain/repositories/city_repository.dart';

import '../../data/failure.dart';
import '../entities/city.dart';

class GetCityList {
  final CityRepository repository;

  GetCityList(this.repository);

  Future<Either<Failure, List<City>>> execute() {
    return repository.getCityList();
  }
}