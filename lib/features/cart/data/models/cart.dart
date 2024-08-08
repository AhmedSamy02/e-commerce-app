import 'package:hive/hive.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';
part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart {
  @HiveField(0)
  final Product product;
  @HiveField(1)
  final int quantity;

  Cart({required this.product, required this.quantity});
}
