import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/no_params.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/user.dart';
import 'package:api_connections_package/domain/repositories/user_repository.dart';

class GetAllUsers implements UseCase<List<User>, NoParams>{
  final UserRepository repository;

  GetAllUsers(this.repository);

  @override
  Future<Either<Failure, List<User>>> execute(noParams) {
    return repository.getAllUsers();
  }
}