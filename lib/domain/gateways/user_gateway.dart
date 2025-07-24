import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/gateway.dart';
import 'package:api_connections_package/core/error/failure.dart';

abstract class UserGateway extends Gateway{
  const UserGateway();
  Future<Either<Failure, List<Map<String, dynamic>>>> getAllUsers();

  Future<Either<Failure, Map<String, dynamic>>> getUserById(int id);

  Future<Either<Failure, Map<String, dynamic>>> addUser(Map<String, dynamic> user);

  Future<Either<Failure, Map<String, dynamic>>> updateUser(int id, Map<String, dynamic> user);

  Future<Either<Failure, void>> deleteUser(int id);
}