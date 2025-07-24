import 'package:api_connections_package/core/contracts/entity.dart';
import 'package:api_connections_package/domain/entities/cart_item.dart';


class Cart  implements Entity{
  final int id;
  final int userId;
  final List<CartItem> products;
  Cart({
    required this.id,
    required this.userId,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    final List<dynamic> productsJson = json['products'];
    final List<CartItem> products = productsJson.map((productJson) => CartItem.fromJson(productJson)).toList();
    return Cart(
      id: json['id'] as int,
      userId: json['userId'] as int,
      products: products
    );
  }
  @override
  Map<String, dynamic> toJson()=>{
      'id': id,
      'userId': userId,
      'products': products.map((product) => product.toJson()).toList(),
    };
}
