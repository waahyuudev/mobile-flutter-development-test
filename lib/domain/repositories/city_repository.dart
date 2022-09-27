import 'package:mobile_development_test/data/failure.dart';
import 'package:mobile_development_test/domain/entities/city.dart';
import 'package:dartz/dartz.dart';

abstract class CityRepository {
  Future<Either<Failure, List<City>>> getCityList();
}