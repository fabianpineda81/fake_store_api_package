import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/repositories/product_repository.dart';

class DeleteProduct implements UseCase<void, int> {
  final ProductRepository repository;

  DeleteProduct(this.repository);
  @override
  Future<Either<Failure, void>> execute(int id) {
    return repository.deleteProduct(id);
  }
}
