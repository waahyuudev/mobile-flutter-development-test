import 'package:mobile_development_test/data/failure.dart';
import 'package:mobile_development_test/data/models/user_model.dart';
import 'package:mobile_development_test/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUserList();
  Future<Either<Failure, bool>> addUser(UserModel userModel);
}