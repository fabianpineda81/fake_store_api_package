import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/cart.dart';
import 'package:api_connections_package/domain/repositories/cart_repository.dart';

class AddCart implements UseCase<Cart, Cart>{
  final CartRepository repository;
  AddCart(this.repository);
  @override
  Future<Either<Failure, Cart>> execute(Cart cart) {
    return repository.addCart(cart);
  }

}