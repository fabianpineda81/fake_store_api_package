import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/user.dart';
import 'package:api_connections_package/domain/repositories/user_repository.dart';

class UpdateUser implements UseCase<User, UpdateUserParams>{
  final UserRepository repository;

  UpdateUser(this.repository);

  @override
  Future<Either<Failure, User>> execute(updateUserParams ) {
    return repository.updateUser(updateUserParams.id, updateUserParams.user);
  }

}

class UpdateUserParams {
  final int id;
  final User user;

  UpdateUserParams({required this.id, required this.user});
}