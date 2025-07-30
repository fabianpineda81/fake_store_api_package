
import 'package:api_connections_package/api/cart_api.dart';
import 'package:api_connections_package/api/product_api.dart';
import 'package:api_connections_package/api/user_api.dart';
import 'package:api_connections_package/api_connections_pakage.dart';

class FakeStoreApi {
  final ProductApi products;
  final CartApi carts;
  final UserApi users;

  FakeStoreApi({ProductRepository? repository, CartRepository? cartRepository, UserRepository? userRepository})
      : products = ProductApi(repository: repository),
        carts = CartApi(repository: cartRepository),
        users = UserApi(repository: userRepository);
}