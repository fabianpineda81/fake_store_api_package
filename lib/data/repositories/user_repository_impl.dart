import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/core/error/failure_severity.dart';
import 'package:api_connections_package/domain/entities/user.dart';
import 'package:api_connections_package/domain/gateways/user_gateway.dart';
import 'package:api_connections_package/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserGateway _gateway;
  UserRepositoryImpl(this._gateway);
  @override
  Future<Either<Failure, User>> addUser(User user) async {
    final result = await _gateway.addUser(user.toJson());

    return result.fold(
      Left.new,
        (json){
          try{
            final user = User.fromJson(json);
            return Right(user);
          }catch(e, stackTrace){
            return Left(
              Failure(
                title: 'Error en el UserRepositoryImpl',
                code: 'mapping_error',
                description: "Error al mapear el usuario despues de agregar el usuario",
                stackTrace: stackTrace.toString(),
                type: FailureSeverity.warning
              )
            );
          }
        }
    );
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id)async {
    final result = await _gateway.deleteUser(id);
    return result.fold(
      Left.new,
        (_) => const Right(null)
    );

  }

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    final result = await _gateway.getAllUsers();
    return result.fold(
      Left.new,
      (json) {
        try{
          return Right(json.map(User.fromJson).toList());
        }catch(e, stackTrace){
          return Left(
            Failure(
              title: 'Error en el UserRepositoryImpl',
              code: 'mapping_error',
              description: "Error al mapear la lista de usuarios",
              stackTrace: stackTrace.toString(),
              type: FailureSeverity.blocking
            )
          );
        }
      },
    );

  }

  @override
  Future<Either<Failure, User>> getUserById(int id) async {
    final result = await _gateway.getUserById(id);
    return result.fold(
      Left.new,
        (json) {
          try{
            final user = User.fromJson(json);
            return Right(user);
          }catch(e, stackTrace){
            return Left(
              Failure(
                title: 'Error en el UserRepositoryImpl',
                code: 'mapping_error',
                description: "Error al mapear el usuario obtenido por id ",
                stackTrace: stackTrace.toString(),
                type: FailureSeverity.blocking
              )
            );
          }
        }
    );

  }

  @override
  Future<Either<Failure, User>> updateUser(int id, User user) async {
    final result = await _gateway.updateUser(id, user.toJson());
    return result.fold(
      Left.new,
        (json) {
          try{
            final user = User.fromJson(json);
            return Right(user);
          }catch(e, stackTrace){
            return Left(
              Failure(
                title: 'Error en el UserRepositoryImpl',
                code: 'mapping_error',
                description: "Error al mapear el usuario despues de actualizar el usuario",
                stackTrace: stackTrace.toString(),
                type: FailureSeverity.blocking
              )
            );
          }
        }
    );
  }

}