import 'package:api_connections_package/core/contracts/no_params.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/core/network/dioclient.dart';
import 'package:api_connections_package/data/datasources/product_gateway_implementation.dart';
import 'package:api_connections_package/data/repositories/product_repository_impl.dart';
import 'package:api_connections_package/domain/entities/product.dart';
import 'package:api_connections_package/domain/repositories/product_repository.dart';
import 'package:api_connections_package/domain/usescases/product/add_product.dart';
import 'package:api_connections_package/domain/usescases/product/delete_product.dart';
import 'package:api_connections_package/domain/usescases/product/get_all_products.dart';
import 'package:api_connections_package/domain/usescases/product/get_product_by_id.dart';
import 'package:api_connections_package/domain/usescases/product/update_product.dart';
import 'package:dartz/dartz.dart';

class ProductApi {
  final GetAllProducts _getAllProductsUseCase;
  final GetProductById _getProductByIdUseCase;
  final DeleteProduct _deleteProductUseCase;
  final UpdateProduct _updateProductUseCase;
  final AddProduct _addProductUseCase;

  ProductApi._(
      this._getAllProductsUseCase,
      this._getProductByIdUseCase,
      this._deleteProductUseCase,
      this._updateProductUseCase,
      this._addProductUseCase,
      );

  factory ProductApi({ProductRepository? repository}) {
    final repo = repository ?? ProductRepositoryImpl(ProductGatewayImplementation(DioClient()));

    return ProductApi._(
      GetAllProducts(repo),
      GetProductById(repo),
      DeleteProduct(repo),
      UpdateProduct(repo),
      AddProduct(repo),
    );
  }

  Future<Either<Failure, List<Product>>> getAllProducts() {
    return _getAllProductsUseCase.execute(NoParams());
  }

  Future<Either<Failure, Product>> getProductById(int id) {
    return _getProductByIdUseCase.execute(id);
  }

  Future<Either<Failure, Product>> addProduct(Product product) {
    return _addProductUseCase.execute(product);
  }

  Future<Either<Failure, Product>> updateProduct(UpdateProductParams updateProductParams) {
    return _updateProductUseCase.execute(updateProductParams);
  }

  Future<Either<Failure, void>> deleteProduct(int id) {
    return _deleteProductUseCase.execute(id);
  }
}
