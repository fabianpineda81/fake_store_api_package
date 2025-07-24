import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/repository.dart';
import 'package:api_connections_package/domain/entities/user.dart';
import '../../core/error/failure.dart';


abstract class UserRepository implements Repository {
  const UserRepository();

  Future<Either<Failure, List<User>>> getAllUsers();

  Future<Either<Failure, User>> getUserById(int id);

  Future<Either<Failure, User>> addUser(User user);

  Future<Either<Failure, User>> updateUser(int id, User user);

  Future<Either<Failure, void>> deleteUser(int id);
}
