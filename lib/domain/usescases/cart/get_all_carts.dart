import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/no_params.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/cart.dart';
import 'package:api_connections_package/domain/repositories/cart_repository.dart';

class GetAllCarts implements UseCase<List<Cart>,NoParams>{
  final CartRepository repository;
  GetAllCarts(this.repository);
  @override
  Future<Either<Failure, List<Cart>>> execute(NoParams params) {
    return repository.getAllCarts();
  }

}