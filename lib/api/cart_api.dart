import 'package:api_connections_package/core/contracts/no_params.dart';
import 'package:api_connections_package/core/error/failure.dart';
import 'package:api_connections_package/core/network/dioclient.dart';
import 'package:api_connections_package/data/datasources/cart_gateway_implementation.dart';
import 'package:api_connections_package/data/repositories/cart_repository_imp.dart';
import 'package:api_connections_package/domain/entities/cart.dart';
import 'package:api_connections_package/domain/repositories/cart_repository.dart';
import 'package:api_connections_package/domain/usescases/cart/add_cart.dart';
import 'package:api_connections_package/domain/usescases/cart/delete_cart.dart';
import 'package:api_connections_package/domain/usescases/cart/get_all_carts.dart';
import 'package:api_connections_package/domain/usescases/cart/get_cart_by_id.dart';
import 'package:api_connections_package/domain/usescases/cart/update_cart.dart';
import 'package:dartz/dartz.dart';


class CartApi {
  final GetAllCarts _getAllCartsUseCase;
  final GetCartById _getCartByIdUseCase;
  final AddCart _addCartUseCase;
  final UpdateCart _updateCartUseCase;
  final DeleteCart _deleteCartUseCase;

  CartApi._(
      this._getAllCartsUseCase,
      this._getCartByIdUseCase,
      this._addCartUseCase,
      this._updateCartUseCase,
      this._deleteCartUseCase,
      );

  factory CartApi({CartRepository? repository}) {
    final repo = repository ?? CartRepositoryImpl(CartGatewayImplementation(DioClient()));

    return CartApi._(
      GetAllCarts(repo),
      GetCartById(repo),
      AddCart(repo),
      UpdateCart(repo),
      DeleteCart(repo),
    );
  }

  Future<Either<Failure, List<Cart>>> getAllCarts() {
    return _getAllCartsUseCase.execute(NoParams() );
  }

  Future<Either<Failure, Cart>> getCartById(int id) {
    return _getCartByIdUseCase.execute(id);
  }

  Future<Either<Failure, Cart>> addCart(Cart cart) {
    return _addCartUseCase.execute(cart);
  }

  Future<Either<Failure, Cart>> updateCart(UpdateCartParams updateCartParams ) {
    return _updateCartUseCase.execute(updateCartParams);
  }

  Future<Either<Failure, void>> deleteCart(int id) {
    return _deleteCartUseCase.execute(id);
  }
}
