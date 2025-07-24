  import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/core/error/failure_severity.dart';
import 'package:api_connections_package/domain/entities/product.dart';
import 'package:api_connections_package/domain/gateways/product_gateway.dart';
import 'package:api_connections_package/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductGateway _gateway;

  ProductRepositoryImpl(this._gateway);

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    final result = await _gateway.getAllProducts();

    return result.fold(
      Left.new,
          (jsonList) {
        try {
          final products = jsonList.map(Product.fromJson).toList();
          return Right(products);
        } catch (e, stackTrace) {
          return Left(
            Failure(
              title: 'Error de mapeo',
              code: 'mapping_error',
              description: e.toString(),
              type: FailureSeverity.blocking,
              stackTrace: stackTrace.toString(),
            )
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, Product>> getProductById(int id) async {
    final result = await _gateway.getProductById(id);

    return result.fold(
      Left.new,
          (json) {
        try {
          final product = Product.fromJson(json);
          return Right(product);
        } catch (e, stackTrace) {
          return Left(Failure(
            title: 'Error de mapeo',
            code: 'mapping_error',
            description: e.toString(),
            type: FailureSeverity.blocking,
            stackTrace: stackTrace.toString(),
          ));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Product>> addProduct(Product product) async {
    final result = await _gateway.addNewProduct(product.toJson());

    return result.fold(
      Left.new,
          (json) {
        try {
          final created = Product.fromJson(json);
          return Right(created);
        } catch (e, stackTrace) {
          return Left(
            Failure(
              title: 'Error al mapear producto nuevo',
              code: 'mapping_error',
              description: e.toString(),
              type: FailureSeverity.blocking,
              stackTrace: stackTrace.toString(),
          ));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Product>> updateProduct(int id, Product product) async {
    final result = await _gateway.updateProduct(id, product.toJson());

    return result.fold(
      Left.new,
          (json) {
        try {
          final updated = Product.fromJson(json);
          return Right(updated);
        } catch (e, stackTrace) {
          return Left(Failure(
            title: 'Error al mapear producto actualizado',
            code: 'mapping_error',
            description: e.toString(),
            type: FailureSeverity.blocking,
            stackTrace: stackTrace.toString(),
          ));
        }
      },
    );
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    final result = await _gateway.deleteProduct(id);

    return result.fold(
      Left.new,
          (_) => const Right(null),
    );
  }
}
