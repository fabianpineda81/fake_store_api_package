import 'package:api_connections_package/core/contracts/no_params.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/core/network/dioclient.dart';
import 'package:api_connections_package/data/datasources/user_gateway_implementation.dart';
import 'package:api_connections_package/data/repositories/user_repository_impl.dart';
import 'package:api_connections_package/domain/entities/user.dart';
import 'package:api_connections_package/domain/repositories/user_repository.dart';
import 'package:api_connections_package/domain/usescases/user/add_user.dart';
import 'package:api_connections_package/domain/usescases/user/delete_user.dart';
import 'package:api_connections_package/domain/usescases/user/get_all_users.dart';
import 'package:api_connections_package/domain/usescases/user/get_user_by_id.dart';
import 'package:api_connections_package/domain/usescases/user/update_user.dart';
import 'package:dartz/dartz.dart';



class UserApi {
  final GetAllUsers _getAllUsersUseCase;
  final GetUserById _getUserByIdUseCase;
  final AddUser _addUserUseCase;
  final UpdateUser _updateUserUseCase;
  final DeleteUser _deleteUserUseCase;

  UserApi._(
      this._getAllUsersUseCase,
      this._getUserByIdUseCase,
      this._addUserUseCase,
      this._updateUserUseCase,
      this._deleteUserUseCase,
      );

  factory UserApi({UserRepository? repository}) {
    final repo = repository ?? UserRepositoryImpl(UserGatewayImplementation(DioClient()));

    return UserApi._(
      GetAllUsers(repo),
      GetUserById(repo),
      AddUser(repo),
      UpdateUser(repo),
      DeleteUser(repo),
    );
  }

  Future<Either<Failure, List<User>>> getAllUsers() {
    return _getAllUsersUseCase.execute(NoParams());
  }

  Future<Either<Failure, User>> getUserById(int id) {
    return _getUserByIdUseCase.execute(id);
  }

  Future<Either<Failure, User>> addUser(User user) {
    return _addUserUseCase.execute(user);
  }

  Future<Either<Failure, User>> updateUser(UpdateUserParams updateProductParams) {
    return _updateUserUseCase.execute(updateProductParams);
  }

  Future<Either<Failure, void>> deleteUser(int id) {
    return _deleteUserUseCase.execute(id);
  }
}
