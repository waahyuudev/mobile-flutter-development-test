import 'package:mobile_development_test/data/failure.dart';
import 'package:mobile_development_test/domain/entities/user.dart';
import 'package:mobile_development_test/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserList {
  final UserRepository repository;

  GetUserList(this.repository);

  Future<Either<Failure, List<User>>> execute() {
    return repository.getUserList();
  }
}