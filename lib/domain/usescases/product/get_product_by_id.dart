import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/product.dart';
import 'package:api_connections_package/domain/repositories/product_repository.dart';

class GetProductById implements UseCase<Product, int> {
  final ProductRepository repository;

  GetProductById(this.repository);
  @override
  Future<Either<Failure, Product>> execute(int id) {
    return repository.getProductById(id);
  }
}
