import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/repositories/user_repository.dart';

class DeleteUser implements UseCase<void, int>{
  final UserRepository repository;
  DeleteUser(this.repository);
  @override
  Future<Either<Failure, dynamic>> execute(int id) {
    return repository.deleteUser(id);
  }
}