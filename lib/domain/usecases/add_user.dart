import 'package:dartz/dartz.dart';
import 'package:mobile_development_test/data/models/user_model.dart';

import '../../data/failure.dart';
import '../repositories/user_repository.dart';

class AddUser {
  final UserRepository repository;

  AddUser(this.repository);

  Future<Either<Failure, bool>> execute(UserModel userModel) {
    return repository.addUser(userModel);
  }
}
