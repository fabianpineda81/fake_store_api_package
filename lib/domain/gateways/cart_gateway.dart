import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/error/failure.dart';

abstract class CartGateway {
  Future<Either<Failure, List<Map<String, dynamic>>>> getAllCarts();

  Future<Either<Failure, Map<String, dynamic>>> getCartById(int id);

  Future<Either<Failure, Map<String, dynamic>>> addCart(Map<String, dynamic> cart);

  Future<Either<Failure, Map<String, dynamic>>> updateCart(int id, Map<String, dynamic> cart);

  Future<Either<Failure, void>> deleteCart(int id);
}