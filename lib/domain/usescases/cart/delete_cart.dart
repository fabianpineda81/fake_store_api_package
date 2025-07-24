import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/repositories/cart_repository.dart';

class DeleteCart implements UseCase<void, int>{
  final CartRepository repository;
  DeleteCart(this.repository);
  @override
  Future<Either<Failure, void>> execute(int id ) {
    return repository.deleteCart(id);
  }

}