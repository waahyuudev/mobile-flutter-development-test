import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:mobile_development_test/data/failure.dart';

import 'package:mobile_development_test/domain/entities/city.dart';

import '../../domain/repositories/city_repository.dart';
import '../datasources/remote_data_source.dart';
import '../exception.dart';

class CityRepositoryImpl implements CityRepository{

  final RemoteDataSource remoteDataSource;

  CityRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<City>>> getCityList() async {
    try {
      final cityModelList = await remoteDataSource.getListCity();
      final result = cityModelList.map<City>((item) => item.toEntity()).toList();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

}