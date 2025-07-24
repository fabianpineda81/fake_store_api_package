import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/usescase.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/product.dart';
import 'package:api_connections_package/domain/repositories/product_repository.dart';

class UpdateProduct implements UseCase<Product, UpdateProductParams> {
  final ProductRepository repository;

  UpdateProduct(this.repository);
  @override
  Future<Either<Failure, Product>> execute(updateProductParams) {
    return repository.updateProduct(
      updateProductParams.id,
      updateProductParams.product,
    );
  }
}
class UpdateProductParams {
  final int id;
  final Product product;

  UpdateProductParams({required this.id, required this.product});
}
