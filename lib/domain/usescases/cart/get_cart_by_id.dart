import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/cart.dart';
import 'package:api_connections_package/domain/repositories/cart_repository.dart';

class GetCartById implements UseCase<Cart, int>{
  final CartRepository repository;
  GetCartById(this.repository);
  @override
  Future<Either<Failure, Cart>> execute(int id) {
    return repository.getCartById(id);

  }

}