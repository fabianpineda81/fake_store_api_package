import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/core/error/failure_severity.dart';
import 'package:api_connections_package/core/network/dioclient.dart';
import 'package:api_connections_package/domain/gateways/cart_gateway.dart';

class CartGatewayImplementation implements CartGateway{
  final DioClient _dioClient;
  CartGatewayImplementation(this._dioClient);
  @override
  Future<Either<Failure, Map<String, dynamic>>> addCart(Map<String, dynamic> cart) async {
    try{
      final response = await _dioClient.post('/carts', data: cart);
      return Right(Map<String, dynamic>.from(response.data));
    }catch(e, stackTrace) {
      if (e is Failure) {
        return left(e);
      }
      return left(
        Failure(
            title: 'Error de gateway',
            code: 'gateway_error',
            description: e.toString(),
            type: FailureSeverity.blocking,
            stackTrace: stackTrace.toString()
        )
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteCart(int id) async {
    try{
      await _dioClient.delete('/carts/$id');
      return Right(null);
    }catch(e, stackTrace) {
      if (e is Failure) {
        return left(e);
      }
      return left(
        Failure(
          title: 'Error de gateway',
          code: 'gateway_error',
          description: e.toString(),
          type: FailureSeverity.blocking,
          stackTrace: stackTrace.toString()
        )
      );
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getAllCarts() async {
    try{
      final response = await _dioClient.get('/carts');
      return Right(List<Map<String, dynamic>>.from(response.data));
    }catch(e, stackTrace) {
      if (e is Failure) {
        return left(e);
      }
      return left(
        Failure(
          title: 'Error de gateway',
          code: 'gateway_error',
          description: e.toString(),
          type: FailureSeverity.blocking,
          stackTrace: stackTrace.toString()
        )
      );
    }


  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCartById(int id) async {
    try{
      final response = await _dioClient.get('/carts/$id');
      return Right(Map<String, dynamic>.from(response.data));
    }catch(e, stackTrace) {
      if (e is Failure) {
        return left(e);
      }
      return left(
        Failure(
          title: 'Error de gateway',
          code: 'gateway_error',
          description: e.toString(),
          type: FailureSeverity.blocking,
          stackTrace: stackTrace.toString()
        )
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateCart(int id, Map<String, dynamic> cart) async {
    try{
      final response = await _dioClient.put('/carts/$id', data: cart);
      return Right(Map<String, dynamic>.from(response.data));
    }catch(e, stackTrace) {
      if (e is Failure) {
        return left(e);
      }
      return left(
        Failure(
          title: 'Error de gateway',
          code: 'gateway_error',
          description: e.toString(),
          type: FailureSeverity.blocking,
          stackTrace: stackTrace.toString()
        )
      );

    }
  }

}