import 'package:hive/hive.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';
part 'cart.g.dart';

@HiveType(typeId: 2)
class Cart {
  @HiveField(0)
  final Product product;
  @HiveField(1)
  int quantity;

  Cart({required this.product, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
}
