

import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/core/error/failure_severity.dart';
import 'package:api_connections_package/core/network/dioclient.dart';
import 'package:api_connections_package/domain/gateways/product_gateway.dart';


class ProductGatewayImplementation implements ProductGateway {
  final DioClient _dioClient;

  ProductGatewayImplementation( this._dioClient);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getAllProducts() async {
    try{
      final response = await _dioClient.get('/products');
      return Right(List<Map<String, dynamic>>.from(response.data));
    }catch(e, stackTrace){
      if (e is Failure) {
        return left(e);
      }
      return left(
         Failure(
          title: 'Error de gateway',
          code: 'gateway_error',
          description: e.toString(),
          type: FailureSeverity.blocking,
           stackTrace: stackTrace.toString(),

        )
      );
    }

  }

  @override
  Future<Either<Failure,Map<String, dynamic>>> getProductById(int id) async {
    try{
      final response = await _dioClient.get('/products/$id');
      return Right(Map<String, dynamic>.from( response.data));
    }catch(e, stackTrace){
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
  Future<Either<Failure,Map<String, dynamic>>> addNewProduct(Map<String, dynamic> product) async {

    try{
      final response = await _dioClient.post('/products', data: product);
      return Right(Map<String, dynamic>.from(response.data));
    }catch(e, stackTrace){
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
  Future<Either<Failure,Map<String, dynamic>>> updateProduct(int id, Map<String, dynamic> product) async {
    try{
      final response = await _dioClient.put('/products/$id', data: product);
      return Right(Map<String, dynamic>.from( response.data));
    }catch(e, stackTrace){
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
  Future<Either<Failure,void>> deleteProduct(int id) async {
   try{
     await _dioClient.delete('/products/$id');
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


}
