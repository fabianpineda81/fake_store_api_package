import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/user.dart';
import 'package:api_connections_package/domain/repositories/user_repository.dart';

class GetUserById implements UseCase<User,int>{
  final UserRepository repository;

  GetUserById(this.repository);

  @override
  Future<Either<Failure, User>> execute(int id) {
    return repository.getUserById(id);
  }

}