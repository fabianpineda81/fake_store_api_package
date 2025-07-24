
import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getAllCarts();

  Future<Either<Failure, Cart>> getCartById(int id);

  Future<Either<Failure, Cart>> addCart(Cart cart);

  Future<Either<Failure, Cart>> updateCart(int id, Cart cart);

  Future<Either<Failure, void>> deleteCart(int id);
}