import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/no_params.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/product.dart';
import 'package:api_connections_package/domain/repositories/product_repository.dart';

class GetAllProducts implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> execute(noParams) {
    return repository.getAllProducts();
  }
}
