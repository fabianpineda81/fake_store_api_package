import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/user.dart';
import 'package:api_connections_package/domain/repositories/user_repository.dart';

class AddUser implements UseCase<User, User>{
  final UserRepository repository;
  AddUser(this.repository);
  @override
  Future<Either<Failure, User>> execute(User user) {
    return repository.addUser(user);
  }

}