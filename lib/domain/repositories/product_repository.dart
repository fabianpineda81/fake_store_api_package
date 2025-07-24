import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/contracts/repository.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/domain/entities/product.dart';

abstract class ProductRepository extends Repository {
  const ProductRepository();

  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, Product>> getProductById(int id);

  Future<Either<Failure, Product>> addProduct(Product product);

  Future<Either<Failure, Product>> updateProduct(int id, Product product);

  Future<Either<Failure, void>> deleteProduct(int id);
}
