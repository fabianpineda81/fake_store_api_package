import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/core/network/dioclient.dart';
import 'package:api_connections_package/domain/gateways/user_gateway.dart';

import '../../core/error/failure_severity.dart';

class UserGatewayImplementation implements UserGateway{
  final DioClient _dioClient;
  UserGatewayImplementation(this._dioClient);

  @override
  Future<Either<Failure, Map<String, dynamic>>> addUser(Map<String, dynamic> user)async {
      try{
        final response = await _dioClient.post('/users', data: user);
        return Right(Map<String, dynamic>.from(response.data));
      }catch(e, stackTrace){
        if(e is Failure){
          return left(e);
        }
        return left(
          Failure(
            title: 'Error de gateway',
            code: 'gateway_error',
            description: e.toString(),
            stackTrace: stackTrace.toString(),
            type: FailureSeverity.blocking
          )
        );
      }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id) async {
    try{
      await _dioClient.delete('/users/$id');
      return Right(null);
    }catch(e, stackTrace){
      if(e is Failure){
        return left(e);
      }
      return left(
        Failure(
          title: 'Error de gateway',
          code: 'gateway_error',
          description: e.toString(),
          stackTrace: stackTrace.toString(),
          type: FailureSeverity.blocking
        )
      );
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getAllUsers() async {
    try{
      final response = await _dioClient.get('/users');
      return Right(List<Map<String, dynamic>>.from(response.data));
    }catch(e,stackTrace){
      if(e is Failure){
        return left(e);
      }
      return left(
        Failure(
          title: 'Error de gateway',
          code: 'gateway_error',
          description: e.toString(),
          stackTrace: stackTrace.toString(),
          type: FailureSeverity.blocking
        )
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserById(int id) async {
    try{
      final response = await _dioClient.get('/users/$id');
      return Right(Map<String, dynamic>.from(response.data));
    }catch(e, stackTrace){
      if(e is Failure){
        return left(e);
      }
      return left(
        Failure(
          title: 'Error de gateway',
          code: 'gateway_error',
          description: e.toString(),
          stackTrace: stackTrace.toString(),
          type: FailureSeverity.blocking
        )
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateUser(int id, Map<String, dynamic> user) async {
    try{
      final response = await _dioClient.put('/users/$id', data: user);
      return Right(Map<String, dynamic>.from(response.data));
    }catch(e, stackTrace){
      if(e is Failure){
        return left(e);
      }
      return left(
        Failure(
          title: 'Error de gateway',
          code: 'gateway_error',
          description: e.toString(),
          stackTrace: stackTrace.toString(),
          type: FailureSeverity.blocking
        )
      );
    }
  }
}