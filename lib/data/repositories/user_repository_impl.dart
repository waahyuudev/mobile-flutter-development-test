import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mobile_development_test/data/failure.dart';
import 'package:mobile_development_test/data/models/user_model.dart';
import 'package:mobile_development_test/domain/repositories/user_repository.dart';
import '../../domain/entities/user.dart';
import '../datasources/remote_data_source.dart';
import '../exception.dart';

class UserRepositoryImpl implements UserRepository{

  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<User>>> getUserList() async {
    try {
      final userModelList = await remoteDataSource.getListUser();
      final result = userModelList.map<User>((item) => item.toEntity()).toList();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, bool>> addUser(UserModel userModel) async {
    try {
      final result = await remoteDataSource.addUser(userModel);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }


}