import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/cart.dart';
import 'package:api_connections_package/domain/repositories/cart_repository.dart';

class UpdateCart implements UseCase<Cart, UpdateCartParams>{
  final CartRepository repository;
  UpdateCart(this.repository);
  @override
  Future<Either<Failure, Cart>> execute(updateCartParams) {
    return repository.updateCart(updateCartParams.id, updateCartParams.cart);
  }

}
class UpdateCartParams {
  final int id;
  final Cart cart;
  UpdateCartParams({required this.id, required this.cart});
}
