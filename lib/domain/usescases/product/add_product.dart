import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/product.dart';
import 'package:api_connections_package/domain/repositories/product_repository.dart';

class AddProduct implements UseCase<Product, Product> {
  final ProductRepository repository;

  AddProduct(this.repository);
  @override
  Future<Either<Failure, Product>> execute(Product product) {
    return repository.addProduct(product);
  }
}
