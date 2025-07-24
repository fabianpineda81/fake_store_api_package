
import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/gateway.dart';
import 'package:api_connections_package/core/error/failure.dart';

abstract class ProductGateway extends Gateway {
  const ProductGateway();

  Future<Either<Failure, List<Map<String, dynamic>>>> getAllProducts();

  Future<Either<Failure,Map<String, dynamic>>> addNewProduct(Map<String, dynamic> product);

  Future<Either<Failure,Map<String, dynamic>>> getProductById(int id);

  Future<Either<Failure,Map<String, dynamic>>> updateProduct(int id, Map<String, dynamic> product);

  Future<Either<Failure,void>> deleteProduct(int id);
}

