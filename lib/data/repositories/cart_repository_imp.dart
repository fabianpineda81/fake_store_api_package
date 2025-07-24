import 'package:dartz/dartz.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/core/error/failure_severity.dart';
import 'package:api_connections_package/domain/entities/cart.dart';
import 'package:api_connections_package/domain/gateways/cart_gateway.dart';
import 'package:api_connections_package/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository{
  final CartGateway _gateway;
  CartRepositoryImpl(this._gateway);
  @override
  Future<Either<Failure, Cart>> addCart(Cart cart) async {
    final result =await _gateway.addCart(cart.toJson());
    return result.fold(
      Left.new,
      (json) {
        try{
          final cart = Cart.fromJson(json);
          return Right(cart);
        }catch(e, stackTrace){
          return Left(
            Failure(
              title: 'Error en el UserRepositoryImpl',
              code: 'mapping_error',
              description: "Error al mapear el carrito despues de agregar el carrito",
              stackTrace: stackTrace.toString(),
              type: FailureSeverity.warning
            )
          );
        }
      }
    );
  }

  @override
  Future<Either<Failure, void>> deleteCart(int id)async {
    final result = await _gateway.deleteCart(id);
    return result.fold(
      Left.new,
        (_) => const Right(null)
    );
  }

  @override
  Future<Either<Failure, List<Cart>>> getAllCarts()async {
    final result = await _gateway.getAllCarts();
    return result.fold(
      Left.new,
          (json) {
        try{
          return Right(json.map(Cart.fromJson).toList());
          }catch(e, stackTrace){
          print(e.toString());
          return Left(
            Failure(
              title: 'Error en el UserRepositoryImpl',
              code: 'mapping_error',
              description: "Error al mapear la lista de carritos",
              stackTrace: stackTrace.toString(),
              type: FailureSeverity.blocking
            )
          );
        }
      }
      );
  }

  @override
  Future<Either<Failure, Cart>> getCartById(int id) async {
    final result = await _gateway.getCartById(id);
    return result.fold(
      Left.new,
          (json) {
        try{
          final cart = Cart.fromJson(json);
          return Right(cart);
        }catch(e, stackTrace){
          return Left(
            Failure(
              title: 'Error en el UserRepositoryImpl',
              code: 'mapping_error',
              description: "Error al mapear el carrito obtenido por id ",
              stackTrace: stackTrace.toString(),
              type: FailureSeverity.blocking
            )
          );
        }
      });


  }

  @override
  Future<Either<Failure, Cart>> updateCart(int id, Cart cart) async {
    final result =await _gateway.updateCart(id, cart.toJson());
    return result.fold(
      Left.new,
        (json) {
          try {
            final cart = Cart.fromJson(json);
            return Right(cart);
          } catch (e, stackTrace) {
            return Left(
              Failure(
                  title: 'Error en el UserRepositoryImpl',
                  code: 'mapping_error',
                  description: "Error al mapear el carrito despues de actualizar el carrito",
                  stackTrace: stackTrace.toString(),
                  type: FailureSeverity.blocking
              )
            );
          }
        });
  }

}